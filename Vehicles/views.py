from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from Customers.models import countries, customer, blood_group
from django.contrib import messages
from datetime import datetime
from Vehicles import models as vehicle_model
from Customers import models as customer_model
from Finance import models as finance_model
from Finance.models import receipt_voucher
from django.db.models import Q


@login_required(login_url="Login")
def register_vehicle(request):
    vehicle_models = vehicle_model.model_brand.objects.all()
    colors = vehicle_model.color.objects.all()
    origins = countries.objects.all()
    cylinders = vehicle_model.cylinder.objects.all()
    owners = customer.objects.all()
    year = []

    for i in range(1960, datetime.now().year):
        year.append(i)

    year.reverse()

    context = {"vehicle_models": vehicle_models, "colors": colors, "origins": origins,
               "cylenders": cylinders, "owners": owners, 'year': year, "pageTitle": 'Register vehicle'}

    if request.method == 'POST':
        model_brand = request.POST.get('model_brand', None)
        color = request.POST.get('color', None)
        origin = request.POST.get('origin', None)
        year = request.POST.get('year', None)
        cylinder = request.POST.get('cylinders', None)
        hp = request.POST.get('hp', None)
        weight = request.POST.get('weight', None)
        passenger_seats = request.POST.get('passenger_seats', None)
        registration_number = request.POST.get(
            'registration_number', None)
        engine_number = request.POST.get('engine_number', None)
        rv_num = request.POST.get('rv_num', None)
        owner_id = request.POST.get('owner_id', None)
        rv_num = request.POST.get('rv_num', None)

        owner = customer_model.customer.objects.filter(
            Q(customer_id=owner_id)).first()
        brand = vehicle_model.model_brand.objects.filter(
            Q(brand_id=model_brand)).first()
        car_color = vehicle_model.color.objects.filter(
            Q(color_id=color)).first()

        car_cylinder = vehicle_model.cylinder.objects.filter(
            Q(cylinder_id=cylinder)).first()

        car_origin = customer_model.countries.objects.filter(
            Q(country_id=origin)).first()

        new_vehicle = vehicle_model.vehicle(
            vehicle_model=brand,
            color=car_color,
            cylinder=car_cylinder,
            year=year,
            origin=car_origin,
            hp=hp,
            weight=weight,
            vin=registration_number,
            enginer_no=engine_number,
            pessenger_seat=passenger_seats,
            owner=owner,
            reg_user_id=request.user.id,
            rv_number=rv_num)

        new_vehicle.save()

    return render(request, "Vehicles/register_vehicle.html", context)


@login_required(login_url="Login")
def seach_owner(request, search):

    if request.method == 'GET':
        # look up the rv
        find_rv = finance_model.receipt_voucher.objects.filter(
            Q(rv_number__icontains=search)).first()

        if find_rv is not None:
            return JsonResponse({
                'isError': False,
                "owner_id": find_rv.rv_from.customer_id,
                'owner_name': f"{ find_rv.rv_from.firstname} {find_rv.rv_from.middle_name} {find_rv.rv_from.lastname} ",
                'mother_name': find_rv.rv_from.mother_name,
                'personal_id': find_rv.rv_from.personal_id
            })

        return JsonResponse({
            'isError': True,
            'message': 'RV Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    })


@login_required(login_url="Login")
def seach_transfer(request, search):

    if request.method == 'GET':
        # look up the rv
        find_rv = finance_model.receipt_voucher.objects.filter(
            Q(rv_number__icontains=search)).first()

        if find_rv is not None:
            return JsonResponse({
                'isError': False,
                "old_hid_id": find_rv.rv_from.customer_id,
                'owner_name': f"{ find_rv.rv_from.firstname} {find_rv.rv_from.middle_name} {find_rv.rv_from.lastname} ",
                'mother_name': find_rv.rv_from.mother_name,
                'personal_id': find_rv.rv_from.personal_id,
                "receipt_number":find_rv.rv_number,

            })

        return JsonResponse({
            'isError': True,
            'message': 'RV Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    })


@login_required(login_url="Login")
def seach_transferrr(request, search):

    if request.method == 'GET':
        # look up the rv
        # find_rv = finance_model.receipt_voucher.objects.filter(
        #     Q(rv_number__icontains=search)).first()
        find_selected_owner = customer_model.customer.objects.filter(
            Q(personal_id=search)).first()

        if find_selected_owner is not None:
            return JsonResponse({
                'isError': False,
                "newownermother_name": find_selected_owner.mother_name,
                "phone": find_selected_owner.phone,
                "new_owner_id":find_selected_owner.customer_id,

            })

        return JsonResponse({
            'isError': True,
            'message': 'owner name Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    }, status=400)


@login_required(login_url="Login")
def tranfercreate(request):
    transfer = vehicle_model.transfare_vehicles.objects.all()
    customers = customer_model.customer.objects.all()
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 5
    SearchQuery = ''

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    paginator = Paginator(transfer, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'pageTitle': 'Transfer Vehicle',
               'page_obj': page_obj,
               'SearchQuery': SearchQuery,
               'DataNumber': DataNumber,
               "transfer": transfer,
               "customers": customers
               }

    if request.method == 'POST':
        old_owner_id = request.POST.get('olold_hid_id', None)
        new_owner_id = request.POST.get('new_owner_id', None)
        receipt_number = request.POST.get('receipt_number', None)
        description = request.POST.get('description', None)
        document = request.FILES.get('document', None)
        reason = request.POST.get('reason', None)

        vehicle_old_id = vehicle_model.vehicle.objects.filter(
            Q(owner=old_owner_id)).first()

        # vehicle_new_id = vehicle_model.vehicle.objects.filter(
        #     Q(owner=new_owner_id)).first()
        
        # vehicle_to_transfare = vehicle_model.vehicle.objects.filter(
        #     Q(owner__customer_id=old_owner_id)).first()

        old_customer = customer_model.customer.objects.filter(
            Q(customer_id=old_owner_id)).first()

        new_transfering = vehicle_model.transfare_vehicles(
            old_owner_id=old_customer.customer_id,
            new_owner_id=new_owner_id,
            vehicle_id=vehicle_old_id.vehicle_id,
            description=description,
            document=document,
            rv_number=receipt_number,
            transfare_reason=reason,
            reg_user_id=request.user.id,
        )

        new_transfering.save()

    return render(request, "Vehicles/transfer.html", context)


@login_required(login_url="Login")
def view_vehicle(request):
    vehicles = vehicle_model.vehicle.objects.all()
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 10
    SearchQuery = ''

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    paginator = Paginator(vehicles, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'pageTitle': 'View Vehicles',
               'page_obj': page_obj,
               'SearchQuery': SearchQuery,
               'DataNumber': DataNumber,
               "vehicles": vehicles
               }
    return render(request, 'Vehicles/veiw_vehicles.html', context)


@login_required(login_url="Login")
def vehicle_profile(request, pk):
    # vehic_id=vehicle.objects.get(id=pk)
    vehicles = vehicle_model.vehicle.objects.filter(vehicle_id=pk).all()

    context = {
        'pageTitle': 'Profile',
        "vehicles": vehicles
    }

    return render(request, 'Vehicles/vehicle_profile.html', context)


@login_required(login_url="Login")
def asign_plate(request,pk):

    
    return redirect("veiw-vehicle")
