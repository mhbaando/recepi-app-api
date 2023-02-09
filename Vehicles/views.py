from django.shortcuts import render, redirect
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .models import vehicle, plate, transfare_vehicles, model_brand, color, cylinder
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from Customers.models import countries, customer, blood_group
from django.contrib import messages
from .forms import Vehicleform, Transferform, Plateform
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
def assign_plate(request):
    form = Plateform()
    if request.method == "POST":
        form = Plateform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "assigned anew plate to a new vehicle")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form, 'pageTitle': 'Assign Aplate'}
    return render(request, "Vehicles/asign_plate.html", context)


@login_required(login_url="Login")
def tranfercreate(request):
    transfer = transfare_vehicles.objects.all()
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 5
    SearchQuery = ''
    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    else:
        pass

    paginator = Paginator(transfer, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'pageTitle': 'Transfer Vehicle',
               'page_obj': page_obj,
               'DataNumber': DataNumber,
               "transfer": transfer
               }
    return render(request, "Vehicles/transfer.html", context)


@login_required(login_url="Login")
def view_vehicle(request):
    vehicles = vehicle.objects.all()
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
    # vehicles=vehicle.objects.filter(id=vehic_id).first()

    context = {
        'pageTitle': 'Profile'
    }

    return render(request, 'Vehicles/vehicle_profile.html', context)
