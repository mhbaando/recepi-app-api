from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from Customers.autditory import save_error
from Vehicles import plate_converter, models as vehicle_model, plate_converter
from Customers import models as customer_model
from Finance import models as finance_model
from django.db.models import Q
from django.http import JsonResponse

from django.contrib.auth.decorators import login_required
from datetime import datetime
from Customers.autditory import save_error, save_log


@login_required(login_url='Login')
def register_mot(request):
    if request.method == 'GET':
        categories = vehicle_model.test_category.objects.all()
        date = datetime.now()  # for determingi the max date of the test

        context = {
            'pageTitle': 'Register MOT',
            'categories': categories,
            'date': date
        }
        return render(request, 'MOT/register.html', context)


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
                            "label": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin} - {searchQuery[xSearch].enginer_no}",
                            "value": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin} -{searchQuery[xSearch].enginer_no}",
                            "vehicle_id": searchQuery[xSearch].vehicle_id,
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
def manage_mot(request):

    return JsonResponse({
        'isError': False,
        'save': 8
    })


@ login_required(login_url="Login")
def find_edit_test(request, id):
    try:
        if request.user.has_perm('Vehicles.view_vehicle'):

            if request.method == 'GET':
                if id is not None:
                    test = ''
                    if request.user.is_superuser:
                        # for admin user
                        test = vehicle_model.test.objects.filter(
                            Q(test_id=id)).values()
                    else:
                        # for state user
                        test = vehicle_model.test.objects.filter(
                            Q(test_id=id),
                        ).values()
                    # find_ele = vehicle_model.test.objects.filter(
                    #     Q(test_id=test[0]['tested_el'])).values('el_name')

                    save_log(request, 'Vehicle / Find',
                             f'waxa uu raadiyay Vehicleka leh')
                    return JsonResponse(
                        {"isErro": False, "Message": list(test)}
                    )
                return JsonResponse({
                    'isError': True,
                    'Message': 'Provide an id'
                })
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not Allowed'
            })
        return render(request, 'Base/403.html')
    except Exception as error:
        save_error(request, error)


def view_mot(request):

    tests = vehicle_model.test.objects.all()
    all_brands=vehicle_model.model_brand.objects.all()

    context = {'pageTitle': 'MOT List', 'tests': tests, "all_brands":all_brands}
    return render(request, 'MOT/view_mot.html', context)
