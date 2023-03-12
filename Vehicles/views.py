from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from datetime import datetime
from Vehicles import models as vehicle_model
from Customers import models as customer_model
from Finance import models as finance_model
from django.db.models import Q
from Users.views import sendException, sendTrials
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required, permission_required
from Customers.autditory import save_error, save_log


@login_required(login_url="Login")
@permission_required('Vehicles.add_vehicle', raise_exception=True)
def register_vehicle(request):
    try:
        if request.user.has_perm('Vehicles.add_vehicle') and request.user.has_perm('Vehicles.view_vehicle'):
            if request.method == 'GET':
                vehicle_models = vehicle_model.model_brand.objects.all()
                colors = vehicle_model.color.objects.all()
                origins = customer_model.countries.objects.all()
                cylinders = vehicle_model.cylinder.objects.all()
                owners = customer_model.customer.objects.all()
                year = []

                for i in range(1960, datetime.now().year + 1):
                    year.append(i)

                year.reverse()
                context = {"vehicle_models": vehicle_models, "colors": colors, "origins": origins,
                           "cylenders": cylinders, "owners": owners, 'year': year, "pageTitle": 'Register vehicle'}
                save_log(request, 'Vehicle / Register',
                         'waxa uu boqday Vehicle Registration')
                return render(request, "vehicles/register_vehicle.html", context)

            elif request.method == 'POST':
                # get data from the request
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
                owner_id = request.POST.get('owner_id', None)
                rv_num = request.POST.get('rv_number', None)

                if model_brand is None or color is None or origin is None or year is None or cylinder is None or hp is None or weight is None or passenger_seats is None or registration_number is None or engine_number is None or rv_num is None or owner_id is None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        }
                    )
                # checking if customer is verified or not
                is_owner_id = customer_model.customer.objects.filter(
                    customer_id=owner_id).first()

                if not is_owner_id.is_verified:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Owner is Not Verified!!",
                            'type': "warning",
                            'Message': f'You have to Verify First before Registering a Car'
                        }
                    )
                # receipt checking if it was used before in vehicles
                is_voucher_exist = vehicle_model.vehicle.objects.filter(
                    rv_number=rv_num).first()

                if is_voucher_exist is not None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'This receipt voucher already used by {is_voucher_exist.owner.full_name}'
                        }
                    )
                # receipt checking if it was used liscence
                found_rv = finance_model.receipt_voucher.objects.filter(
                    Q(rv_number=rv_num)).first()

                isvoucer_in_liscence = ''
                if found_rv is not None:
                    isvoucer_in_liscence = customer_model.license.objects.filter(
                        receipt_voucher=found_rv).first()

                if isvoucer_in_liscence:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'this voucher is already used in Liscence'
                        }
                    )
                # checking if the rv is being used in transfare vehicles
                r_v = finance_model.receipt_voucher.objects.filter(
                    Q(rv_number=rv_num)).first()

                isvoucer_in_transfare = ''
                if r_v is not None:
                    isvoucer_in_transfare = vehicle_model.transfare_vehicles.objects.filter(
                        rv_number=r_v).first()

                if isvoucer_in_transfare:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'this voucher is already used in Transfare Vehicle'
                        }
                    )
                else:

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

                    if owner is None or brand is None or car_color is None or car_origin is None:
                        return JsonResponse({'isError': True, 'Message': 'Bad Request'}, status=400)

                    if request.user.is_superuser == False and request.user.federal_state is None:
                        return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

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

                    save_log(request, 'Vehicles / Register',
                             f'Waxa uu gaari udiiwangaliyay {new_vehicle.owner}')
                    # return for post method
                    return JsonResponse({'isError': False, 'Message': 'Vehicle has been successfully Saved'}, status=200)
        else:

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


# searching receipt for their owner


# @login_required(login_url="Login")
# def seach_owner(request, search):
#     if request.method == 'GET':
#         # look up the rv
#         find_rv = finance_model.receipt_voucher.objects.filter(
#             Q(rv_number__icontains=search)).first()

#         if find_rv is not None:
#             return JsonResponse({
#                 'isError': False,
#                 "owner_id": find_rv.rv_from.customer_id,
#                 'owner_name': f"{ find_rv.rv_from.firstname} {find_rv.rv_from.middle_name} {find_rv.rv_from.lastname} ",
#                 'mother_name': find_rv.rv_from.mother_name,
#                 'personal_id': find_rv.rv_from.personal_id
#             })

#         return JsonResponse({
#             'isError': True,
#             'message': 'RV Not Found'
#         })
#     return JsonResponse({
#         'isError': True,
#         'message': 'Method not allowd'
#     })


@ login_required(login_url="Login")
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

# searching owner for verification purpose
# autogenerated plate number


@ login_required(login_url="Login")
def vehicle_plate_info(request, id):
    if request.method == 'GET':
        # look up the rv
        # find_rv = finance_model.receipt_voucher.objects.filter(
        #     Q(rv_number__icontains=id)).first()

        find_selected_owner = vehicle_model.vehicle.objects.filter(
            Q(vehicle_id=id)).first()

        find_latest_plate = vehicle_model.plate.objects.order_by(
            '-created_at').first()

        find_code = vehicle_model.code_plate.objects.order_by(
            '-created_at').first()

        plate_no = None
        if find_latest_plate is not None:
            plate_no = find_latest_plate.plate_no
        # print(plate_no)

        if find_selected_owner is not None:
            return JsonResponse({
                'isError': False,
                "vehicle_model": find_selected_owner.vehicle_model.brand_name,
                "code_plate": find_code.code_name,
                "owner": find_selected_owner.owner.full_name,

            })

        return JsonResponse({
            'isError': True,
            'message': 'owner name Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    }, status=400)


@ login_required(login_url="Login")
def vehice_plate_code(request, id):
    if request.method == 'GET':

        find_selected_code = vehicle_model.code_plate.objects.filter(
            Q(code_id=id)).first()

        find_code = vehicle_model.plate.objects.filter(plate_code=id).first()

        plate_cod = None
        if find_code is not None:
            plate_cod = find_code.plate_no
            print(plate_cod)

        if find_selected_code is not None:
            return JsonResponse({
                'isError': True,
                "plate_code": find_selected_code.code_id,
                "number": plate_cod
            })

        return JsonResponse({
            'isError': True,
            'message': 'owner name Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    }, status=400)


@ login_required(login_url="Login")
def vehicle_plate_state(request, id):
    if request.method == 'GET':

        # find_selected_owner = vehicle_model.vehicle.objects.filter(plate_id=id).first()

        find_latest_plate = vehicle_model.plate.objects.order_by(
            '-created_at').first()

        find_code = vehicle_model.code_plate.objects.order_by(
            '-created_at').first()

        plate_noo = None
        if find_latest_plate is not None:
            plate_noo = find_latest_plate.state.state_name
        # print(plate_no)

        if find_latest_plate is not None:
            return JsonResponse({
                'isError': False,
                'number': plate_noo


            })

        return JsonResponse({
            'isError': True,
            'message': 'owner name Not Found'
        })
    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    }, status=400)


@ login_required(login_url="Login")
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
        'message': 'Method not allowed'
    }, status=400)


@ login_required(login_url="Login")
@ permission_required('Vehicles.add_transfare_vehicles', raise_exception=True)
def tranfercreate(request):
    try:

        if request.user.has_perm('Vehicles.add_transfare_vehicles'):
            if request.method == 'POST':
                old_owner_id = request.POST.get('olold_hid_id', None)
                reason = request.POST.get('reason', None)
                new_owner_id = request.POST.get('new_hid_id', None)
                receipt_number = request.POST.get('receipt_number', None)
                description = request.POST.get('description', None)
                vehicle_id = request.POST.get('vehicleID', None)
                document = request.FILES['transfer_document']

                is_voucher_exist = vehicle_model.transfare_vehicles.objects.filter(
                    rv_number=receipt_number).first()

                if is_voucher_exist is not None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'This receipt voucher already been used'
                        }
                    )

                isperson_exit = vehicle_model.vehicle.objects.filter(
                    owner_id=new_owner_id).first()

                if isperson_exit is not None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f"you can't transfer a Vehicle to the same person "
                        }
                    )
                if document.size > 2000000:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "File Uppload Must be 2MB Maximimum",
                        }
                    )
                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)
                else:

                    vehicle_old_id = vehicle_model.vehicle.objects.filter(
                        Q(owner=old_owner_id)).first()

                    old_customer = customer_model.customer.objects.filter(
                        Q(customer_id=old_owner_id)).first()

                    car_to_update = vehicle_model.vehicle.objects.filter(
                        vehicle_id=vehicle_id).first()
                    new_owner = customer_model.customer.objects.filter(
                        customer_id=new_owner_id).first()
                    car_to_update.owner = new_owner
                    car_to_update.save()

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
                    save_log(request, 'Vehicles / Register',
                             f'Waxa uu gaari kawarejiyay {new_transfering.old_owner} kuna wareejiyay {new_transfering.new_owner}')
                    # return for post method
                    return JsonResponse({'isError': False, 'Message': 'A New Transfer has been Succesfully Saved'}, status=200)
        else:

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


@ login_required(login_url="Login")
@ permission_required('Vehicles.view_vehicle', raise_exception=True)
def view_vehicle(request):
    year = []
    vehicles = []
    noplates = []
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
    else:
        # admins can view all users
        states = customer_model.federal_state.objects.all()

    stateappre = [{
        'name': 'Banaadir',
        'appreviation': 'BN'
    },
        {
        'name': 'Hirshabeelle',
        'appreviation': 'HR'
    },
        {
        'name': 'Galmudug',
        'appreviation': 'GM'
    },
        {
        'name': 'Puntland',
        'appreviation': 'PN'
    },
        {
        'name': 'Koonfur Galbeed',
        'appreviation': 'KG'
    },
        {
        'name': 'Jubba land',
        'appreviation': 'JL'
    },
        {
        'name': 'Somali land',
        'appreviation': 'SL'
    }
    ]
    plate_type = vehicle_model.code_plate.objects.all().order_by(
        '-created_at')
    plates = vehicle_model.plate.objects.all()
    type_count = {}
    for ptype in plate_type:
        type_count[ptype.code_name] = 0

    for plate in plates:
        type_count[plate.plate_code.code_name] += 1

    stateappr = ""
    types = vehicle_model.type.objects.all().order_by(
        '-created_at')
    plate_number = vehicle_model.plate.objects.all().order_by(
        '-created_at')

    all_vehicles = vehicle_model.vehicle.objects.all().order_by(
        '-created_at')

    if all_vehicles is not None:
        for vh in all_vehicles:
            stateap = ""
            for stateapp in stateappre:
                if vh.plate_no is not None:
                    if vh.plate_no.state.state_name == stateapp['name']:
                        stateap = stateapp['appreviation']

            vehicles.append({
                'vehicle_id': vh.vehicle_id,
                'model': vh.vehicle_model,
                'vin': vh.vin,
                'year': vh.year,
                'hp': vh.hp,
                'passenger': vh.pessenger_seat,
                'rv_no': vh.rv_number,
                "owner": vh.owner,
                'plate_no': f'{stateap}-{vh.plate_no.plate_code}-{vh.plate_no.plate_no}' if vh.plate_no is not None else None
            })

    for i in range(1960, datetime.now().year):
        year.append(i)
    year.reverse()

    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    CheckStatus = 'Status' in request.GET
    DataNumber = 10
    Status = "Active"
    SearchQuery = ''
    vehicle_lists = []

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])
    if CheckStatus:
        Status = request.GET.get('Status')
    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']

        vehicles = vehicle_model.vehicle.objects.filter(
            Q(owner__full_name__icontains=SearchQuery) | Q(
                pessenger_seat__icontains=SearchQuery) |
            Q(vin__icontains=SearchQuery)
        ).order_by('-created_at')
    paginator = Paginator(vehicles, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {'pageTitle': 'View Vehicles',
               'page_obj': page_obj,
               'SearchQuery': SearchQuery,
               'DataNumber': DataNumber,
               "vehicles": vehicles,
               "states": states,
               "plate_c": plate_type,
               "types": types,
               "currentYear": datetime.now().year,
               "plate_number": plate_number,
               "noplates": noplates,
               "total": len(vehicle_lists)

               }
    return render(request, 'vehicles/veiw_vehicles.html', context)


@ login_required(login_url="Login")
def vehicle_profile(request, pk):

    cylenders = vehicle_model.cylinder.objects.all().order_by(
        '-created_at')
    colors = vehicle_model.color.objects.all().order_by(
        '-created_at')
    vehicle_models = vehicle_model.model_brand.objects.all().order_by(
        '-created_at')
    origins = customer_model.countries.objects.all().order_by(
        '-created_at')

    # cylinders = vehicle_model.cylinder.objects.all()
    year = []

    for i in range(1960, datetime.now().year):
        year.append(i)

    year.reverse()
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
                    Q(vehicle_id=pk)).first()

            transfares = vehicle_model.transfare_vehicles.objects.filter(
                Q(vehicle=vehicle)).all()

            context = {
                'vehicle': vehicle,
                "transfares": transfares,
                'pageTitle': 'Vehicle Profile',
                "cylenders": cylenders, "year": year, "colors": colors,
                "origins": origins, "vehicle_models": vehicle_models,
            }

            return render(request, 'vehicles/vehicle_profile.html', context)
        else:
            return JsonResponse({'isError': True, 'Message': 'Provide a Vehicle ID'}, status=4)


@ login_required(login_url="Login")
def find_vehicle(request, id):
    try:
        if request.user.has_perm('Vehicles.view_vehicle'):

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
                            Q(vehicle_id=id),
                        ).values()

                    save_log(request, 'Vehicle / Find',
                             f'waxa uu raadiyay Vehicleka leh')
                    return JsonResponse(
                        {"isErro": False, "Message": list(vehicle)}
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


@ login_required(login_url="Login")
@ permission_required('Vehicles.change_vehicle', raise_exception=True)
def update_vehicle(request):
    try:
        if request.user.has_perm('Vehicles.add_vehicle'):
            if request.method == 'POST':
                vehicle_id = request.POST.get('vehicleID', None)
                vweight = request.POST.get('weight', None)
                vhp = request.POST.get('hp', None)
                vpassenger_seats = request.POST.get('passenger_seats', None)
                vengine_no = request.POST.get('engine_no', None)
                rv_number = request.POST.get('rv_number', None)
                vcolor = request.POST.get('color', None)
                vcylinder = request.POST.get('cylinder', None)
                vbrand = request.POST.get('model_brand', None)
                year = request.POST.get('year', None)
                vorigin = request.POST.get('origin', None)

                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=vehicle_id)).first()

                c_color = vehicle_model.color.objects.filter(
                    Q(color_id=vcolor)).first()

                c_cylinder = vehicle_model.cylinder.objects.filter(
                    Q(cylinder_id=vcylinder)).first()

                c_origin = customer_model.countries.objects.filter(
                    Q(country_id=vorigin)).first()

                c_brand = vehicle_model.model_brand.objects.filter(
                    Q(brand_id=vbrand)).first()

                vehicle.weight = vweight
                vehicle.hp = vhp
                vehicle.pessenger_seat = vpassenger_seats
                vehicle.enginer_no = vengine_no
                vehicle.rv_number = rv_number
                vehicle.year = year
                vehicle.color = c_color
                vehicle.cylinder = c_cylinder
                vehicle.origin = c_origin
                vehicle.vehicle_model = c_brand

                vehicle.save()

                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Vehicle / Register"
                action = f'Updated A Vehicle {vbrand} at {datetime.now()}'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'Vehicle has been updated succesfully'}, status=200)
        else:

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


@ login_required(login_url="Login")
@ permission_required('Vehicles.add_plate', raise_exception=True)
def asign_plate(request):
    try:
        if request.user.has_perm('Vehicles.add_plate'):

            year = []
            types = vehicle_model.type.objects.all()

            for i in range(1960, datetime.now().year):
                year.append(i)

            year.reverse()

            if request.method == 'POST':
                vehicleiddd = request.POST.get('vehicleIdd', None)
                code = request.POST.get('code', None)
                state = request.POST.get('state', None)

                types = request.POST.get('type', None)
                number = request.POST.get('number', None)
                year = request.POST.get('year')

                selected_type = vehicle_model.type.objects.filter(
                    type_id=types).first()

                selected_state = customer_model.federal_state.objects.filter(
                    Q(state_id=state)).first()

                selected_vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=vehicleiddd)).first()
                selected_code = vehicle_model.code_plate.objects.filter(
                    Q(code_id=code)).first()
                if code is None or state is None or types is None or year is None or number is None or year is None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        }
                    )

                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)
                else:

                    # create plate
                    new_plate = vehicle_model.plate(
                        plate_code=selected_code,
                        state=selected_state,
                        plate_no=number,
                        year=year,
                        type=selected_type,
                        reg_user_id=request.user.id,
                    )

                    new_plate.save()
                    # assign plate to the car
                    vehicle_to_assign_plate = vehicle_model.vehicle.objects.filter(
                        Q(vehicle_id=vehicleiddd)).first()
                    if vehicle_to_assign_plate is not None:
                        vehicle_to_assign_plate.plate_no = new_plate
                        vehicle_to_assign_plate.save()
                    username = request.user.username
                    names = request.user.first_name + ' ' + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Vehicle / View Vehicle"
                    action = f'Registered A plate {code} at {datetime.now()}'
                    path = request.path
                    sendTrials(request, username, names,
                               avatar, action, module, path)
                    # return for post method
                    return JsonResponse({'isError': False, 'Message': 'A New Plate has been registered '}, status=200)

        else:

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
    context = {

        "types": types,
        "currentYear": datetime.now().year,
    }

    return render(request, 'vehicles/assign_model.html', context)


@ login_required(login_url='Login')
def Searchcustomer(request, search):
    if request.method == 'GET':
        searchQuery = customer_model.customer.objects.filter(
            Q(full_name__icontains=search))
        message = []
        for xSearch in range(0, len(searchQuery)):
            message.append(
                {
                    'label': f"{searchQuery[xSearch].full_name}",
                    'value': f"{searchQuery[xSearch].full_name}",
                    'full_name': searchQuery[xSearch].full_name,
                    'personal_id': searchQuery[xSearch].personal_id,
                    'newowner_mother_name': searchQuery[xSearch].mother_name,
                    'new_hid_id': searchQuery[xSearch].customer_id,
                }
            )
        return JsonResponse({'Message': message}, status=200)


@ login_required(login_url='Login')
# Search Query
def SearchReceiptVoucher(request, search):
    if request.method == 'GET':
        searchQuery = finance_model.receipt_voucher.objects.filter(
            Q(rv_number__icontains=search))
        message = []
        for xSearch in range(0, len(searchQuery)):
            message.append(
                {
                    'label': f"{searchQuery[xSearch].rv_number}",
                    'value': f"{searchQuery[xSearch].rv_number}",
                    'rv_id': searchQuery[xSearch].rv_id,

                }
            )
        return JsonResponse({'Message': message}, status=200),


@login_required(login_url='Login')
@permission_required('Vehicles.add_code_plate', raise_exception=True)
def code_plate_name(request):

    try:
        if request.user.has_perm('Vehicles.add_code_plate'):
            if request.user.has_perm('Vehicles.add_code_plate'):

                codeplate = request.POST.get('code', None)
                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

                new_code = vehicle_model.code_plate(
                    code_name=codeplate,
                    reg_user_id=request.user.id,

                )
                new_code.save()
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Vehicle / Register"
                action = f'Registered A New Code Plate {codeplate} at {datetime.now()}'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'A New Code Plate has been Registered'}, status=200)
        else:
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
