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
from Users.views import sendException, sendTrials


@login_required(login_url="Login")
def Searchvehicle(request, search):
    try:
        if request.user.has_perm("vehicles.view_vehicle"):
            if request.method == "GET":
                searchQuery = vehicle_model.vehicle.objects.filter(
                    Q(enginer_no__icontains=search) | Q(
                        owner__full_name__icontains=search) | Q(vin__icontains=search) | Q(plate_no__plate_no__icontains=search)
                )

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
    try:
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
                # get data
                vin = request.POST.get('vin', None)
                testno = request.POST.get('testno', None)
                testread = request.POST.get('testread', None)
                expdate = request.POST.get('expdate', None)
                testCat = request.POST.get('testCat', None)
                selectedTests = request.POST.get(
                    'selectedTests', None).split(',')  # -> ['1','12','13']
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

                # print(date.today(), get_test.expired_date)
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
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not Allowed'
            })
        return redirect('un_authorized')
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + ' ' + request.user.last_name
        # register the error
        sendException(
            request, username, name, error)
        message = {
            'isError': True,
            'Message': 'On Error Occurs . Please try again or contact system administrator'
        }
        return JsonResponse(message, status=200)


@permission_required('Vehicles.view_test', raise_exception=True)
@login_required(login_url='Login')
def view_mot(request):
    try:
        if request.user.has_perm('Vehicles.add_test'):
            tests = []
            tests = vehicle_model.test.objects.all()
            CheckSearchQuery = "SearchQuery" in request.GET
            CheckDataNumber = "DataNumber" in request.GET
            CheckStatus = "Status" in request.GET

            Status = "Active"
            SearchQuery = ""
            DataNumber = 10

            if CheckDataNumber:
                DataNumber = int(request.GET["DataNumber"])

            if CheckStatus:
                Status = request.GET.get("Status")

            if CheckSearchQuery:
                SearchQuery = request.GET["SearchQuery"]

                tests = (
                    vehicle_model.test.objects
                    .filter(Q(tested_vehicle__vehicle_model__brand_name__icontains=SearchQuery))
                    .order_by("-created_at")
                )
            paginator = Paginator(tests, DataNumber)
            page_number = request.GET.get("page")
            test_obj = paginator.get_page(page_number)
            context = {
                'SearchQuery': SearchQuery,
                'DataNumber': DataNumber,
                'pageTitle': 'View MOTs',
                'tests': test_obj,
                'total': len(tests),


            }

            # context['tests'] = tests
            return render(request, 'MOT/view_mot.html', context)
        return redirect('un_authorized')
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + ' ' + request.user.last_name
        # register the error
        sendException(
            request, username, name, error)
        message = {
            'isError': True,
            'Message': 'On Error Occurs . Please try again or contact system administrator'
        }
        return JsonResponse(message, status=200)


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
