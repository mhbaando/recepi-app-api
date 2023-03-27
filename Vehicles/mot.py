from django.shortcuts import render, redirect
from django.contrib.auth.decorators import login_required, permission_required
from Customers.autditory import save_error
from Vehicles import plate_converter, models as vehicle_model, plate_converter
from Customers import models as customer_model
from Finance import models as finance_model
from django.db.models import Q
from django.http import JsonResponse

from django.contrib.auth.decorators import login_required
from datetime import datetime, date
from Customers.autditory import save_error, save_log
from django.core.paginator import Paginator
from Vehicles.forms import Mot_form


@login_required(login_url="Login")
def Searchvehicle(request, search):
    try:
        if request.user.has_perm("Customers.view_customer") and request.user.has_perm('Vehicles.view_vehicle'):
            if request.method == "GET":
                searchQuery = []
                if not request.user.is_superuser and request.user.federal_state is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Update Your state'
                    })

                if request.user.is_superuser:
                    searchQuery = vehicle_model.vehicle.objects.filter(
                        Q(enginer_no__icontains=search) | Q(
                            owner__full_name__icontains=search) | Q(vin__icontains=search) | Q(plate_no__plate_no__icontains=search)
                    )
                else:
                    searchQuery = vehicle_model.vehicle.objects.filter(
                        Q(enginer_no__icontains=search) | Q(
                            owner__full_name__icontains=search) | Q(vin__icontains=search) | Q(plate_no__plate_no__icontains=search)
                    ).filter(owner__federal_state=request.user.federal_state)

                message = []
                for xSearch in range(0, len(searchQuery)):
                    message.append(
                        {
                            "label": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin}",
                            "value": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin}",
                            "model_year": f"{searchQuery[xSearch].vehicle_model} - {searchQuery[xSearch].year}",
                            "personal_id": f"{searchQuery[xSearch].owner.personal_id}",
                            "phone": f"{searchQuery[xSearch].owner.phone}",
                            "vehicle_id": f"{searchQuery[xSearch].vehicle_id}"
                        }
                    )
                return JsonResponse({"Message": message})
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not Allowed'
            })
        return render(request, 'Base/403.html')
    except Exception as error:
        save_error(request, error)


@login_required(login_url='Login')
def find_test_el(request, id):
    if request.method == 'GET':
        if id is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Bad Request'
            })
        found_category = vehicle_model.test_category.objects.filter(
            cat_id=id).first()

        if found_category is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Category Not found'
            })

        # find test element grouped by their first cat
        find_testEl = vehicle_model.test_elements.objects.filter(
            Q(test_cat=found_category)).all()

        if find_testEl is None:
            return JsonResponse({
                'isError': True,
                'Message': 'There is no element assoicated with this category'
            })

        test_el = []
        for el in find_testEl:
            test_el.append({
                'id': el.el_id,
                'name': el.el_name
            })

        return JsonResponse({
            'test_el': test_el
        })

    return JsonResponse({
        'isError': True,
        'Message': 'Method Not allowed'
    })


@login_required(login_url='Login')
@permission_required('Vehicles.add_test', raise_exception=True)
def register_mot(request):
    # try:
    if request.user.has_perm('Vehicles.add_test'):
        if request.method == 'GET':
            categories = vehicle_model.test_category.objects.all()
            dates = datetime.now()  # for determingi the max date of the test

            context = {
                'pageTitle': 'Register MOT',
                'categories': categories,
                'date': dates
            }
            return render(request, 'MOT/register.html', context)
        if request.method == 'POST':
            motform = Mot_form(request.POST)
            if motform.is_valid():
                cleaned_data = motform.cleaned_data
                vin = cleaned_data['vin']
                testno = cleaned_data['testno']
                testread = cleaned_data['testread']
                expdate = cleaned_data['expdate']
                testCat = cleaned_data['testCat']
                # -> ['1','12','13']
                selectedTests = cleaned_data['selectedTests']
                # convert to number slected tests now is sting
                selectedTests = [int(num) for num in selectedTests]

                if vin is None or testno is None or testread is None or expdate is None or testCat is None or len(selectedTests) <= 0 or selectedTests is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Bad Request Provide all all info needed'
                    })

                # 1. find the car to test
                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vin=vin)).first()
                if vehicle is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Vehicle Not found'
                    })

                # 2. find teset category ['1','12','13']
                test_category = vehicle_model.test_category.objects.filter(
                    cat_id=testCat).first()
                if test_category is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Test Categor is not found'
                    })

                # 3. register test
                # 3.1 before you register a new test makes usre this car doesn't get any test and the recent test is not expired
                get_test = vehicle_model.test.objects.filter(
                    Q(tested_vehicle=vehicle)).first()

                if get_test is not None and (get_test.test_cat == test_category and get_test.expired_date <= date.today()):
                    return JsonResponse({
                        'isError': True,
                        'Message': 'The Vehilce has Active un expired test'
                    })

                if not request.user.is_superuser and request.user.federal_state != vehicle.owner.federal_state:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'you cant register on behalf of other state'
                    })

                test_toregister = vehicle_model.test(
                    test_meter=testread,
                    test_num=testno,
                    expired_date=expdate,
                    tested_vehicle=vehicle,
                    test_cat=test_category,
                    reg_user=request.user
                )
                test_toregister.save()

                # 4.1 find all elementes assoicated to that category
                test_elements = vehicle_model.test_elements.objects.filter(
                    Q(test_cat=test_category)).all()

                # 4.2 loop over it and save it the test_reulst holder
                for test_els in test_elements:
                    # 4.3 check if the selected elements are inside the test_elements if its make it true else make it false
                    test_result = vehicle_model.test_result_holder(
                        test_id=test_toregister,
                        test_el=test_els,
                        status=True if test_els.el_id in selectedTests else False
                    )
                    test_result.save()

                return JsonResponse({
                    'isError': False,
                    'Message': 'Saved Succefully'
                })
            error_message = ''
            for field, errors in motform.errors.items():
                for error in errors:
                    if '__all__' not in field:
                        error_message += f'{field}: {error}\n'
            return JsonResponse({
                'isError': True,
                'Message': error_message
            })
        return JsonResponse({
            'isError': True,
            'Message': 'Method Not Allowed'
        })
    return redirect('un_authorized')
    # except Exception as error:
    #     save_error(request, error)


@permission_required('Vehicles.view_test', raise_exception=True)
@login_required(login_url='Login')
def view_mot(request):
    try:
        if request.user.has_perm('Vehicles.add_test'):
            view_test = []
            if request.user.is_superuser:
                tests = vehicle_model.test.objects.all().order_by('created_at')
            else:
                if request.user.federal_state is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Update your State to View MOT'
                    })
                tests = vehicle_model.test.objects.filter(
                    Q(tested_vehicle__owner__federal_state=request.user.federal_state))

            CheckSearchQuery = "SearchQuery" in request.GET
            CheckDataNumber = "DataNumber" in request.GET
            CheckStatus = "Status" in request.GET

            SearchQuery = ""
            DataNumber = 10

            if CheckDataNumber:
                DataNumber = int(request.GET["DataNumber"])

            if CheckStatus:
                Status = request.GET.get("Status")

            if CheckSearchQuery:
                SearchQuery = request.GET["SearchQuery"]
                if request.user.is_superuser:
                    if test is not None:
                        tests = (
                            vehicle_model.test.objects
                            .filter(Q(tested_vehicle__vehicle_model__brand_name__icontains=SearchQuery) | Q(tested_vehicle__vin__icontains=SearchQuery)
                                    | (Q(test_num__icontains=SearchQuery))
                                    )

                        )

                else:
                    tests = (
                        vehicle_model.test.objects
                        .filter(Q(tested_vehicle__vehicle_model__brand_name__icontains=SearchQuery) | Q(tested_vehicle__vin__icontains=SearchQuery)
                                | (Q(test_num__icontains=SearchQuery))
                                )

                    ).filter(Q(tested_vehicle__owner__federal_state=request.user.federal_state))

            for test in tests:
                test_res = vehicle_model.test_result_holder.objects.filter(
                    Q(test_id=test.test_id))
                is_passed = 'Passed'
                for res in test_res:
                    if not res.status:
                        is_passed = 'Failed'

                view_test.append({
                    'test_id': test.test_id,
                    'test_num': test.test_num,
                    'test_meter': test.test_meter,
                    'tested_vehicle': f"{test.tested_vehicle.vehicle_model} - {test.tested_vehicle.vin}",
                    'status': is_passed,
                    'issue_date': test.issue_date,
                    'expired_date': test.expired_date
                })

            paginator = Paginator(view_test, DataNumber)
            page_number = request.GET.get("page")
            test_obj = paginator.get_page(page_number)
            save_log(request, 'Vehicle / MOT Register',
                     'waxa uu boqday MOT Registration')
            context = {
                'SearchQuery': SearchQuery,
                'DataNumber': DataNumber,
                'pageTitle': 'View MOTs',
                'tests': test_obj,
                'total': len(tests),
            }

            return render(request, 'MOT/view_mot.html', context)
        return redirect('un_authorized')
    except Exception as error:
        save_error(request, error)


@login_required(login_url='Login')
def view_single_test(request, id):
    context = {
        'pageTitle': 'View Test'
    }
    test = vehicle_model.test.objects.filter(Q(test_id=id)).first()
    test_res = vehicle_model.test_result_holder.objects.filter(
        Q(test_id=test.test_id)).all()
    context['test'] = test
    context['test_res'] = test_res

    return render(request, 'MOT/single_test.html', context)


@login_required(login_url='Login')
def print_single_test(request, id):
    test = vehicle_model.test.objects.filter(Q(test_id=id)).first()
    test_res = vehicle_model.test_result_holder.objects.filter(
        Q(test_id=test.test_id)).all()
    context = {
        'pageTitle': 'Test Report',
        'test': test,
        'test_res': test_res
    }
    return render(request, 'MOT/single_test_print.html', context)


@login_required(login_url='Login')
def print_mot_cert(request, id):

    if request.user.has_perm('Vehicles.view_test'):
        test = vehicle_model.test.objects.filter(Q(test_id=id)).first()
        if test is None:
            return redirect('un_authorized')
        test_res = vehicle_model.test_result_holder.objects.filter(
            Q(test_id=test.test_id)).all()

        is_passed = True
        for res in test_res:
            if not res.status:
                is_passed = False

        if not is_passed:
            return JsonResponse({
                'isError': True,
                'Message': 'This vehicle didnt pass any test'
            })

        test_data = {
            'test_num': test.test_num,
            'tested_vehicle': test.tested_vehicle,
            'issue_date': test.issue_date,
            'test_meter': test.test_meter,
            'expired_date': test.expired_date,
            'plate_no': plate_converter.shorten(test.tested_vehicle.plate_no.state.state_name, test.tested_vehicle.plate_no.plate_code, test.tested_vehicle.plate_no.plate_no),
            'reg_user': f"{test.reg_user.first_name} {test.reg_user.last_name}"
        }

        context = {
            'pageTitle': 'Certificate',
            'test': test_data,
            'test_res': test_res
        }

        return render(request, 'MOT/mot_certificate.html', context)
    return redirect('un_authorized')
