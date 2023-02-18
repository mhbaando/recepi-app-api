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
                "receipt_number": find_rv.rv_number,

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
def vehicle_plate_info(request, id):

    if request.method == 'GET':
        # look up the rv
        # find_rv = finance_model.receipt_voucher.objects.filter(
        #     Q(rv_number__icontains=id)).first()
        find_selected_owner = vehicle_model.vehicle.objects.filter(
            Q(vehicle_id=id)).first()

        find_latest_plate = vehicle_model.plate.objects.order_by(
            '-created_at').first()

        if find_selected_owner is not None:
            return JsonResponse({
                'isError': False,
                "vehicle_model": find_selected_owner.vehicle_model.brand_name,
                "owner": find_selected_owner.owner.full_name,
                "number": find_latest_plate.plate_no
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
                "new_owner_id": find_selected_owner.customer_id,

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
    states = customer_model.federal_state.objects.all()
    types = vehicle_model.type.objects.all()
    year = []

    for i in range(1960, datetime.now().year):
        year.append(i)

    year.reverse()
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
               "vehicles": vehicles,
               "states": states,
               "types": types,
               "year": year,
               }

    if request.method == 'POST':
        vehicleiddd = request.POST.get('vehicleId', None)
        code = request.POST.get('code', None)
        state = request.POST.get('state', None)
        types = request.POST.get('type', None)
        number = request.POST.get('number', None)
        year = request.POST.get('year')

        selected_type = vehicle_model.type.objects.filter(Q(type_id=types))

        selected_state = customer_model.federal_state.objects.filter(
            Q(state_id=state)).first()

        selected_vehicle = vehicle_model.vehicle.objects.filter(
            Q(vehicle_id=vehicleiddd)).first()
        print(selected_vehicle)

        new_plate = vehicle_model.plate(
            vehicle=selected_vehicle,
            plate_code=code,
            state=selected_state,
            plate_no=number,
            year=year,
            type=selected_type,

            reg_user_id=request.user.id,
        )

        new_plate.save()

    return render(request, 'Vehicles/veiw_vehicles.html', context)


@login_required(login_url="Login")
def vehicle_profile(request, pk):
    transfer = vehicle_model.transfare_vehicles.objects.all()
    if request.method == 'GET':
        if pk is not None:
            vehicle = ''
            if request.user.is_superuser:
                # for admin user
                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=pk)).first()
            else:
                # for state user
                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=pk), federal_state=request.user.federal_state).first()

            context = {
                'vehicle': vehicle,
                "transfer": transfer,
                'pageTitle': 'ProFile'
            }

            return render(request, 'Vehicles/vehicle_profile.html', context)
        else:
            return JsonResponse({'isError': True, 'Message': 'Provide a Vehicle ID'}, status=400)
    # # vehic_id=vehicle.objects.get(id=pk)
    # vehicles = vehicle_model.vehicle.objects.filter(vehicle_id=pk).all()

    # context = {
    #     'pageTitle': 'Profile',
    #     "vehicles": vehicles
    # }


@ login_required(login_url="Login")
def find_vehicle(request, id):

    if request.method == 'GET':
        if id is not None:
            vehicle = ''
            if request.user.is_superuser:
                # for admin user
                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=id)).values()
            else:
                # for state user
                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=id), federal_state=request.user.federal_state).values()

            return JsonResponse({'isErro': False, 'Message': list(vehicle)}, status=200)
        else:
            return JsonResponse({'isErro': False, 'Message': 'Vehicle Not Found'}, status=404)
    else:
        return JsonResponse({'isErro': False, 'Message': 'Method Not Allowed'}, status=404)


# @ login_required(login_url="Login")
# def update_vehicle(request):
#     customer_id = request.POST.get('customer_id', None)
#     f_name = request.POST.get('fname', None)
#     m_name = request.POST.get('sname', None)
#     th_name = request.POST.get('thname', None)
#     fo_name = request.POST.get('foname', None)
#     full_name = request.POST.get('full_name', None)
#     mother_name = request.POST.get('mname', None)
#     dob = request.POST.get('dob', None)
#     personal_id = request.POST.get('perid', None)
#     gender = request.POST.get('gender', None)
#     group = request.POST.get('bload_group', None)
#     nationality = request.POST.get('nationality', None)
#     phone = request.POST.get('phone', None)
#     email = request.POST.get('email', None)
#     address = request.POST.get('address', None)
#     state = request.POST.get('state', None)

#     if customer_id is not None:
#         customer = customer_model.customer.objects.filter(
#             customer_id=customer_id).first()
#         state = customer_model.federal_state.objects.filter(state_id=state)
#         bload_group = customer_model.blood_group.objects.filter(
#             blood_group_id=group)

#         if customer is not None:
#             pass

#     return JsonResponse({
#         'hellw': 4
#     })


@login_required(login_url="Login")
def asign_plate(request, pk):

    return redirect("view-vehicle")
