import os
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from datetime import datetime
from Vehicles import models as vehicle_model, plate_converter
from Customers import models as customer_model
from Finance import models as finance_model
from django.db.models import Q
from Users.views import sendException, sendTrials
from django.contrib.auth.models import Permission
from django.contrib.auth.decorators import login_required, permission_required
from Customers.autditory import save_error, save_log
from .plate_converter import shorten
from Vehicles.forms import vehicle_form, update_form, assign_form, code_plates, transfer_form


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

                year.reverse
                context = {"vehicle_models": vehicle_models, "colors": colors, "origins": origins,
                           "cylenders": cylinders, "owners": owners, 'year': year, "pageTitle": 'Register vehicle'}
                save_log(request, 'Vehicle / Register',
                         'waxa uu boqday Vehicle Registration')
                return render(request, "vehicles/register_vehicle.html", context)

            elif request.method == 'POST':
                vehicleform = vehicle_form(request.POST)
                if vehicleform.is_valid():
                    cleared_data = vehicleform.cleaned_data
                # get data from the request
                    model_brand = cleared_data['model_brand']
                    color = cleared_data['color']
                    origin = cleared_data['origin']
                    year = cleared_data['year']
                    cylinder = cleared_data['cylinders']
                    hp = cleared_data['hp']
                    weight = cleared_data['weight']
                    passenger_seats = cleared_data['passenger_seats']
                    registration_number = cleared_data['registration_number']
                    engine_number = cleared_data['engine_number']
                    owner_id = cleared_data['owner_id']
                    rv_num = cleared_data['rv_number']

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

                    # check if the vin number or engine number already registered
                    vin_exist = vehicle_model.vehicle.objects.filter(
                        Q(vin=registration_number)).exists()
                    engine_no_exits = vehicle_model.vehicle.objects.filter(
                        Q(enginer_no=engine_number)).exists()

                    if vin_exist:
                        return JsonResponse({
                            'isError': True,
                            'Message': 'Vin Number Already Registered to other vehicle'
                        })
                    if engine_no_exits:
                        return JsonResponse({
                            'isError': True,
                            'Message': 'Engine Number Already Registered to other vehicle'
                        })

                    # Save Vehicle
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
                error_message = ''
                for field, errors in vehicleform.errors.items():
                    for error in errors:
                        if '__all__' not in field:
                            error_message += f'{field}: {error}\n'
                return JsonResponse({
                    'isError': True,
                    'Message': error_message
                })
            return JsonResponse({
                'isError': True,
                'Message': 'methode not allowe'
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

        find_selected_owner = vehicle_model.vehicle.objects.filter(
            Q(vehicle_id=id)).first()

        find_latest_plate = vehicle_model.plate.objects.order_by(
            '-created_at').first()

        find_code = vehicle_model.code_plate.objects.order_by(
            '-created_at').first()

        plate_no = None
        if find_latest_plate is not None:
            plate_no = find_latest_plate.plate_no

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
def vehicle_plate_gen(request):
    if request.method == 'POST':
        plate_code = request.POST.get('plate_code')
        plate_state = request.POST.get('plate_state')

        if plate_code is None or plate_state is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Bad Request'
            })
        find_selected_state = customer_model.federal_state.objects.filter(
            Q(state_id=plate_state)).first()
        find_selected_code = vehicle_model.code_plate.objects.filter(
            Q(code_id=plate_code)).first()

        if find_selected_code is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Select Code is invalid'
            })
        if find_selected_state is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Selected State is Invalid'
            })

        find_plate_no = vehicle_model.plate.objects.filter(
            Q(state=find_selected_state)).filter(Q(plate_code=find_selected_code)).first()

        # check if the plate is full
        if find_plate_no is not None and int(find_plate_no.plate_no) == 9999:
            return JsonResponse({
                'isError': True,
                'Message': f'Plate number is full select another platce code'
            })

        plate_no = 1 if find_plate_no is None else int(
            find_plate_no.plate_no) + 1

        return JsonResponse({
            'gen_plate': shorten(find_selected_state.state_name, find_selected_code.code_name, plate_no),
            'plate_no': plate_no
        })

    return JsonResponse({
        'isError': True,
        'message': 'Method not allowd'
    })


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
    # try:

    if request.user.has_perm('Vehicles.add_transfare_vehicles'):
        if request.method == 'POST':
            transfareform = transfer_form(request.POST, request.FILES)
            if transfareform.is_valid():
                cleared_data = transfareform.cleaned_data

                old_owner_id = cleared_data['olold_hid_id']
                reason = cleared_data['reason']
                new_owner_id = cleared_data['new_hid_id']
                receipt_number = cleared_data['receipt_number']
                description = cleared_data['description']
                vehicle_id = cleared_data['vehicleID']
                transfer_document = cleared_data['transfer_document']

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

                if os.path.isfile(transfer_document):
                    file_size = os.path.getsize(transfer_document)
                    if file_size > 2097152:
                        return JsonResponse(
                            {
                                "isError": True,
                                "Message": "File Uppload Must be 2MB Maximimum",
                            }
                        )

                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

                vehcile_to_transfer = vehicle_model.vehicle.objects.filter(
                    Q(owner=old_owner_id)).first()

                old_customer = customer_model.customer.objects.filter(
                    Q(customer_id=old_owner_id)).first()

                if vehcile_to_transfer is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': f'{old_customer.full_name} does\'t have this car'
                    })

                car_to_update = vehicle_model.vehicle.objects.filter(
                    vehicle_id=vehicle_id).first()
                new_owner = customer_model.customer.objects.filter(
                    customer_id=new_owner_id).first()

                if not new_owner.is_verified:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'New Owner is not verified'
                    })

                new_transfering = vehicle_model.transfare_vehicles(
                    old_owner_id=old_customer.customer_id,
                    new_owner_id=new_owner_id,
                    vehicle_id=vehcile_to_transfer.vehicle_id,
                    description=description,
                    document=transfer_document,
                    rv_number=receipt_number,
                    transfare_reason=reason,
                    reg_user_id=request.user.id,
                )

                new_transfering.save()

                car_to_update.owner = new_owner
                car_to_update.save()

                save_log(request, 'Vehicles / Register',
                         f'Waxa uu gaari kawarejiyay {new_transfering.old_owner} kuna wareejiyay {new_transfering.new_owner}')
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'A New Transfer has been Succesfully Saved'}, status=200)
            error_message = ''
            for field, errors in transfareform.errors.items():
                for error in errors:
                    if '__all__' not in field:
                        error_message += f'{field}: {error}\n'
            return JsonResponse({
                'isError': True,
                'Message': error_message
            })

    return redirect('un_authorized')

    # except Exception as error:
    #     username = request.user.username
    #     name = request.user.first_name + ' ' + request.user.last_name
    #     # register the error
    #     sendException(
    #         request, username, name, error)
    #     message = {
    #         'isError': True,
    #         'Message': 'On Error Occurs . Please try again or contact system administrator'
    #     }
    #     return JsonResponse(message, status=200)


@ login_required(login_url="Login")
@ permission_required('Vehicles.view_vehicle', raise_exception=True)
def view_vehicle(request):
    year = []
    vehicles = []
    noplates = []
    plate_search = []
    # customers = []
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
    else:
        # admins can view all users
        states = customer_model.federal_state.objects.all()

    plate_type = vehicle_model.code_plate.objects.all().order_by(
        '-created_at')
    plates = vehicle_model.plate.objects.all()

    types = vehicle_model.type.objects.all().order_by(
        '-created_at')

    all_vehicles = []
    if request.user.is_superuser:
        all_vehicles = vehicle_model.vehicle.objects.all().order_by(
            '-created_at')
    else:
        if request.user.federal_state is None:
            return JsonResponse({
                'isError': True,
                'Message': 'Update Your State to view vehicles'
            })

        all_vehicles = vehicle_model.vehicle.objects.filter(Q(owner__federal_state=request.user.federal_state)).order_by(
            '-created_at')

    if all_vehicles is not None:
        for vh in all_vehicles:

            vehicles.append({
                'vehicle_id': vh.vehicle_id,
                'model_bra': vh.vehicle_model.brand_name,
                'vin': vh.vin,
                'year': vh.year,
                'hp': vh.hp,
                'passenger': vh.pessenger_seat,
                'rv_no': vh.rv_number,
                "owner": vh.owner,
                'plate_no': shorten(vh.plate_no.state.state_name, vh.plate_no.plate_code, vh.plate_no.plate_no) if vh.plate_no else None

            })

    for i in range(1960, datetime.now().year + 1):
        year.append(i)
    year.reverse()

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

        if request.user.is_superuser:
            vehicles = (
                vehicle_model.vehicle.objects
                .filter(Q(owner__full_name__icontains=SearchQuery) | (Q(vin__icontains=SearchQuery))
                        | (Q(vehicle_id__icontains=SearchQuery)) | (Q(plate_no__plate_no__icontains=SearchQuery))
                        | (Q(plate_no__plate_no__icontains=SearchQuery)))

            )
        else:
            vehicles = (
                vehicle_model.vehicle.objects
                .filter(Q(owner__full_name__icontains=SearchQuery) | (Q(vin__icontains=SearchQuery))
                        | (Q(vehicle_id__icontains=SearchQuery)) | (Q(plate_no__plate_no__icontains=SearchQuery))
                        | (Q(plate_no__plate_no__icontains=SearchQuery))).filter(Q(owner__federal_state=request.user.federal_state))

            )

    paginator = Paginator(vehicles, DataNumber)
    page_number = request.GET.get("page")
    vehicle_obj = paginator.get_page(page_number)

    context = {'pageTitle': 'View Vehicles',
               'SearchQuery': SearchQuery,
               'DataNumber': DataNumber,
               "vehicles": vehicle_obj,
               "states": states,
               "plate_c": plate_type,
               "types": types,
               "currentYear": datetime.now().year,
               "noplates": noplates,
               "total": len(vehicles),


               }
    save_log(request, 'Vehicle / Register',
             'waxa uu boqday View Vehicle')
    return render(request, 'vehicles/veiw_vehicles.html', context)


@ login_required(login_url="Login")
@ permission_required('Vehicles.view_vehicle', raise_exception=True)
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

    for i in range(1960, datetime.now().year + 1):
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
                if request.user.federal_state is None:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'Update your state'
                    })

                vehicle = vehicle_model.vehicle.objects.filter(
                    Q(vehicle_id=pk)).filter(Q(owner__federal_state=request.user.federal_state)).first()

            if vehicle is None:
                return redirect('un_authorized')

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
                             f'waxa uu raadiyay Vehicleka leh {id} gaan')
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
                updateform = update_form(request.POST)
                if updateform.is_valid():
                    cleared_data = updateform.cleaned_data
                    vehicle_id = cleared_data['vehicleID']
                    vweight = cleared_data['weight']
                    vhp = cleared_data['hp']
                    vpassenger_seats = cleared_data['passenger_seats']
                    vengine_no = cleared_data['engine_no']
                    rv_number = cleared_data['rv_number']
                    vcolor = cleared_data['color']
                    vcylinder = cleared_data['cylinder']
                    vbrand = cleared_data['model_brand']
                    year = cleared_data['year']
                    vorigin = cleared_data['origin']

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
                    save_log(request, 'Vehicles / Update Car',
                             f'Waxa uu gaari udiiwangaliyay {vehicle.owner}')
                    # return for post method
                    return JsonResponse({'isError': False, 'Message': 'Vehicle has been updated succesfully'}, status=200)
                error_message = ''
            for field, errors in updateform.errors.items():
                for error in errors:
                    if '__all__' not in field:
                        error_message += f'{field}: {error}\n'
            return JsonResponse({
                'isError': True,
                'Message': error_message
            })

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
                assignform = assign_form(request.POST)
                if assignform.is_valid():
                    cleared_data = assignform.cleaned_data
                    vehicleiddd = cleared_data['vehicleIdd']
                    code = cleared_data['code']
                    state = cleared_data['state']

                    types = cleared_data['type']
                    number = cleared_data['number']
                    year = cleared_data['year']

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
                            plate_no='{:0>4}'.format(number),
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

                        save_log(request, 'Vehicles / Plate',
                                 f'Waxa uu register gareeyay plate number ka gaarigaan leh {new_plate.plate_no}')
                        # return for post method
                        return JsonResponse({'isError': False, 'Message': 'A New Plate has been registered '}, status=200)
                error_message = ''
                for field, errors in assign_form.errors.items():
                    for error in errors:
                        if '__all__' not in field:
                            error_message += f'{field}: {error}\n'
                return JsonResponse({
                    'isError': True,
                    'Message': error_message
                })
        else:

            return redirect('un_authorized')

        context = {

            "types": types,
            "currentYear": datetime.now().year,
        }

        return render(request, 'vehicles/assign_model.html', context)
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


@ login_required(login_url='Login')
def Searchcustomer(request, search):
    if request.method == 'GET':
        searchQuery = customer_model.customer.objects.filter(
            Q(full_name__icontains=search) | Q(personal_id__icontains=search))

        print(searchQuery)
        if searchQuery is not None:
            message = []
            print(searchQuery)
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
        return JsonResponse({
            'isError': True,
            'Message': 'Customer Not Found'
        })


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


@ login_required(login_url='Login')
@ permission_required('Vehicles.add_code_plate', raise_exception=True)
def code_plate_name(request):

    try:
        if request.user.has_perm('Vehicles.add_code_plate'):
            if request.method == 'POST':
                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

                codeplate = code_plates(request.POST)

                if codeplate.is_valid():
                    cleared_data = codeplate.cleaned_data

                    codeplate = cleared_data['code']

                    new_code = vehicle_model.code_plate(
                        code_name=codeplate,
                        reg_user_id=request.user.id,

                    )
                    new_code.save()
                    save_log(request, 'Vehicles / Vehicles / Add Code Plate',
                             f'Waxa uu gaari udiiwangaliyay {new_code.code_name} kaan le')
                    # return for post method
                    return JsonResponse({'isError': False, 'Message': 'A New Code Plate has been Registered'}, status=200)
                error_message = ''
                for field, errors in codeplate.errors.items():
                    for error in errors:
                        if '__all__' not in field:
                            error_message += f'{field}: {error}\n'
                return JsonResponse({
                    'isError': True,
                    'Message': error_message
                })

        else:
            return redirect('un_authorized')

    except Exception as error:
        save_error(request, error)
