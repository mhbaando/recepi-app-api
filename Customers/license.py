from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required, permission_required
from django.core.paginator import Paginator
# Create your views here.
# Register License
from datetime import date, datetime
from django.db.models import Q, OuterRef, Exists
from Finance import models as finance_model
from Customers import models as customer_model
from Finance import models as finance_model
from Vehicles import models as vehicle_model
from Users.views import sendException, sendTrials
current_date = date.today()
currentDatetime = datetime.now()
years_to_add = current_date.year + 3
expired_year = current_date.replace(year=years_to_add)


@login_required(login_url='Login')
@permission_required('Customers.add_license', raise_exception=True)
def NewLicense(request):
    states = []
    place_issues = []

    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
        place_issues = customer_model.placeissue.objects.filter(
            Q(state=request.user.federal_state))
    else:
        # admins can view all users
        states = customer_model.federal_state.objects.all()
        place_issues = customer_model.placeissue.objects.all()

    licensetype = customer_model.licensetype.objects.all()
    context = {
        'states': states,
        'expired_year': expired_year,
        'licensetype': licensetype,
        'last_license': GenerateLicenseNumber,
        'pageTitle': 'Register License',
        'place_issues': place_issues,

    }
    return render(request, 'License/NewLicense.html', context)

# Re-New License


@login_required(login_url='Login')
@permission_required('Customers.add_license', raise_exception=True)
def ReNewLicense(request):
    place_issue = customer_model.placeissue.objects.all()
    if request.user.is_admin or request.user.is_superuser:
        FederalState = customer_model.federal_state.objects.all()

    else:
        FederalState = customer_model.federal_state.objects.filter(
            Q(state_id=request.user.federal_state.state_id))

    licensetype = customer_model.licensetype.objects.all()
    context = {
        'FederalState': FederalState,
        'licensetype': licensetype,
        'expired_year': expired_year,
        'pageTitle': 'Renew License',
        'place_issue': place_issue,
    }

    return render(request, 'License/ReNewLicense.html', context)
# License Lists


@login_required(login_url='Login')
@permission_required('Customers.view_license', raise_exception=True)
def LicenseLists(request):
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    CheckStatus = 'Status' in request.GET
    DataNumber = 10
    Status = "Active"
    SearchQuery = ''
    Licenselists = []
    states = customer_model.federal_state.objects.all().order_by('created_at')
    place_issues = customer_model.placeissue.objects.all().order_by('created_at')
    licensetype = customer_model.licensetype.objects.all().order_by('created_at')

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])
    if CheckStatus:
        Status = request.GET.get('Status')
    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
        if request.user.is_admin or request.user.is_superuser:
            Licenselists = customer_model.license.objects.filter(
                Q(owner__full_name__icontains=SearchQuery) |
                Q(owner__phone__icontains=SearchQuery) |
                Q(reg_no__icontains=SearchQuery) |
                Q(federal_state__state_name__icontains=SearchQuery),
                status=Status,

            ).order_by('-created_at')
        else:
            Licenselists = customer_model.license.objects.filter(
                Q(owner__full_name__icontains=SearchQuery) |
                Q(owner__phone__icontains=SearchQuery) |
                Q(reg_no__icontains=SearchQuery) |
                Q(federal_state__state_name__icontains=SearchQuery),
                status=Status, federal_state=request.user.federal_state).order_by('-created_at')

    else:
        if request.user.is_admin or request.user.is_superuser:
            Licenselists = customer_model.license.objects.filter(status=Status
                                                                 ).order_by('-created_at')
        else:
            Licenselists = customer_model.license.objects.filter(status=Status, federal_state=request.user.federal_state

                                                                 ).order_by('-created_at')
    get_active_license = customer_model.license.objects.filter(
        status="Active", expired_date__lte=current_date).order_by('-created_at')
    for x in range(0, len(get_active_license)):
        get_current_license = customer_model.license.objects.get(
            license_id=get_active_license[x].license_id)
        get_current_license.status = "Active"
        get_current_license.save()

    paginator = Paginator(Licenselists, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'licenselist': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,
        'total': len(Licenselists),
        'pageTitle':  'License Lists',
        'Status': Status,
        "states": states,
        "place_issues": place_issues,
        "licensetype": licensetype,
    }
    return render(request, 'License/LicenseLists.html', context)


@login_required(login_url='Login')
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
        return JsonResponse({'Message': message}, status=200)


@login_required(login_url='Login')
def customer_info(request, id):
    if request.method == 'GET':
        try:
            vouchers = finance_model.receipt_voucher.objects.get(
                rv_id=id)
            licenses = customer_model.license.objects.filter(
                owner=vouchers.rv_from.customer_id).exists()
            license = ''
            if licenses:
                license = customer_model.license.objects.filter(owner=vouchers.rv_from.customer_id
                                                                ).order_by('created_at')[0]
                new_expired_year = current_date.replace(
                    year=license.expired_date.year+3)

                message = {
                    'ownar_name': f"{vouchers.rv_from.full_name}",
                    'mother_name': f"{vouchers.rv_from.mother_name}",
                    'personal_id': f"{vouchers.rv_from.personal_id}",
                    'owner_cust': f"{vouchers.rv_from.customer_id}",
                    'personal_id_type': f"{vouchers.rv_from.personal_id_type.personal_name}",
                    'license': f"{license.reg_no}" if license else 'No License',
                    'expire_date': f"{license.expired_date}" if license else 'None',
                    'new_expired_year': new_expired_year,
                    'liecense_id': license.license_id,
                }

                return JsonResponse({'Message': message}, status=200)
            message = {
                'ownar_name': f"{vouchers.rv_from.full_name}",
                'mother_name': f"{vouchers.rv_from.mother_name}",
                'personal_id': f"{vouchers.rv_from.personal_id}",
                'owner_cust': f"{vouchers.rv_from.customer_id}",
                'personal_id_type': f"{vouchers.rv_from.personal_id_type.personal_name}",
                'license': 'no Lecenses',
                'expire_date': 'None',
                'new_expired_year': expired_year,
            }

            return JsonResponse({'Message': message}, status=200)

        except Exception as error:
            # username = request.user.username
            # name = request.user.first_name + ' ' + request.user.last_name
            message = {
                'title': "Server Error",
                'type': "error",
                'isError': True,
                'Message': f"On Error Occurs. { str(error)}. Please try again or contact system administrator"
            }

            return JsonResponse(message, status=200)


@login_required(login_url='Login')
@permission_required('Customers.add_license', raise_exception=True)
def manage_license(request, id):
    try:

        # TODO: check permision
        if request.user.has_perm('Customers.add_license'):
            if id == 0:
                # Post new  Weapon model and check if the user is allowed to create
                if request.method == 'POST':
                    Type = request.POST.get('Type')
                    if Type == "new_license":
                        # owner = request.POST.get('owner')
                        federal_state = request.POST.get('federal_state')
                        place_of_issue = request.POST.get('place_issue')
                        license_type = request.POST.get('license_type')

                        rv_id = request.POST.get('rv_id')
                        rv_num = request.POST.get('rv_number')
                        is_voucher_exist = customer_model.license.objects.filter(
                            receipt_voucher__rv_id=rv_id).exists()

                        if is_voucher_exist:
                            get_voucher = customer_model.license.objects.get(
                                receipt_voucher__rv_id=rv_id)
                            message = {
                                'isError': True,
                                'title': "Duplicate Error!!",
                                'type': "warning",
                                'Message': f'This receipt voucher already used by {get_voucher.owner.full_name}'
                            }
                            return JsonResponse(message, status=200)

                        isvoucer_in_vehicle = vehicle_model.vehicle.objects.filter(
                            Q(rv_number=rv_num)).first()

                        if isvoucer_in_vehicle is not None:
                            return JsonResponse(
                                {
                                    'isError': True,
                                    'title': "Duplicate Error!!",
                                    'type': "warning",
                                    'Message': f'this voucher is already used in Vehicle'
                                }
                            )
                        isvoucer_in_transfare = vehicle_model.transfare_vehicles.objects.filter(
                            Q(rv_number=rv_num)).exists()

                        if isvoucer_in_transfare:
                            return JsonResponse(
                                {
                                    'isError': True,
                                    'title': "Duplicate Error!!",
                                    'type': "warning",
                                    'Message': f'this voucher is already used in Transfare Vehicles'
                                }
                            )

                        # get instance of license type
                        get_license_type = customer_model.licensetype.objects.get(
                            type_id=license_type)
                        # get instance of receipt voucher
                        get_rv_number = finance_model.receipt_voucher.objects.get(
                            rv_id=rv_id)

                        # get instance of owner
                        get_owner = customer_model.customer.objects.get(
                            customer_id=get_rv_number.rv_from.customer_id)

                        # get instance of federal state
                        get_federal_state = customer_model.federal_state.objects.get(
                            state_id=federal_state)
                        get_place_issue = customer_model.placeissue.objects.get(
                            place_id=place_of_issue)

                        owner_hase_license = customer_model.license.objects.filter(
                            Q(owner=get_owner)).exists()

                        if owner_hase_license:
                            return JsonResponse({
                                'isError': True,
                                'Message': 'Owner has previous license'
                            })

                        save_license = customer_model.license(
                            federal_state=get_federal_state,
                            owner=get_owner,
                            type=get_license_type,
                            expired_date=expired_year,
                            place_of_issue=get_place_issue,
                            reg_user=request.user,
                            receipt_voucher=get_rv_number,
                            reg_no=GenerateLicenseNumber()
                        )
                        save_license.save()
                        # TODO: Add to Trial
                        message = {
                            'isError': False,
                            'title': "Successfully!!!",
                            'type': "success",
                            'Message': 'New license has been successfully created'
                        }

                        return JsonResponse(message, status=200)
                    elif Type == "renew_license":
                        # owner = request.POST.get('owner')
                        federal_state = request.POST.get('federal_state')

                        license_type = request.POST.get('license_type')

                        rv_id = request.POST.get('rv_id')
                        is_voucher_exist = customer_model.license.objects.filter(
                            receipt_voucher=rv_id).exists()

                        if is_voucher_exist:
                            get_voucher = customer_model.license.objects.get(
                                receipt_voucher=rv_id)
                            message = {
                                'isError': True,
                                'title': "Duplicate Error!!",
                                'type': "warning",
                                'Message': f'This receipt voucher already used by {get_voucher.owner.full_name}'
                            }
                            return JsonResponse(message, status=200)
                        else:

                            # get instance of license type
                            get_license_type = customer_model.licensetype.objects.get(
                                type_id=license_type)
                            # get instance of receipt voucher
                            get_rv_number = finance_model.receipt_voucher.objects.get(
                                rv_id=rv_id)

                            # get instance of owner
                            get_owner = customer_model.customer.objects.get(
                                customer_id=get_rv_number.rv_from.customer_id)

                            # get instance of federal state
                            get_federal_state = customer_model.federal_state.objects.get(
                                state_id=federal_state)
                            get_lasted_license = customer_model.license.objects.filter(
                                owner=get_owner.customer_id).order_by('-license_id')[0]
                            save_license = customer_model.license(
                                federal_state=get_federal_state,
                                owner=get_owner,
                                type=get_license_type,
                                expired_date=expired_year,
                                place_of_issue=get_federal_state.state_name,
                                reg_user=request.user,
                                receipt_voucher=get_rv_number,
                                reg_no=get_lasted_license.reg_no
                            )
                            save_license.save()
                            # TODO: Add to Trial
                            message = {
                                'isError': False,
                                'title': "Successfully!!!",
                                'type': "success",
                                'Message': 'New license has been successfully created'
                            }

                            return JsonResponse(message, status=200)
                    else:
                        message = {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'This receipt voucher already used by {get_voucher.owner.full_name}'
                        }
                        return JsonResponse(message, status=200)
        else:

            return redirect('un_authorized')
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + ' ' + request.user.last_name

        message = {
            'isError': True,
            'title': "Server Error",
            'type': "error",
            'Message': error
        }
        return JsonResponse(message, status=200)


# License Generator


def GenerateLicenseNumber():
    last_id = customer_model.license.objects.filter(~Q(reg_no=None)).last()
    serial = 0
    if last_id is not None:
        serial = int(last_id.reg_no[5:])
    serial = serial + 1

    if serial < 10:
        serial = '000' + str(serial)
    elif serial < 100:
        serial = '00' + str(serial)
    elif serial < 1000:
        serial = '0' + str(serial)

    year = currentDatetime.strftime('%y')

    return f"{year}{serial}"


def update_liscence(request):

    pass


@login_required(login_url="Login")
def find_liscence(request, id):
    if request.method == 'GET':
        if id is not None:
            liscence = ''
            if request.user.is_superuser:
                # for admin user
                liscence = customer_model.license.objects.filter(
                    Q(license_id=id)).values()
            else:
                # for state user
                liscence = customer_model.license.objects.filter(
                    Q(license_id=id), federal_state=request.user.federal_state).values()

            return JsonResponse({'isErro': False, 'Message': list(liscence)}, status=200)
        else:
            return JsonResponse({'isErro': False, 'Message': 'Liscence Not Found'}, status=404)


@login_required(login_url="Login")
def find_status(request, id):
    if request.method == 'GET':

        if id is not None:
            liscences = ''
            if request.user.is_superuser:
                # for admin user
                liscences = customer_model.license.objects.filter(
                    Q(license_id=id)).values()
            else:
                # for state user
                liscences = customer_model.license.objects.filter(
                    Q(license_id=id), federal_state=request.user.federal_state).values()

            return JsonResponse({'isErro': False, 'Message': list(liscences)}, status=200)
        else:
            return JsonResponse({'isErro': False, 'Message': 'Liscence Not Found'}, status=404)


@login_required(login_url="Login")
@permission_required('Customers.change_license', raise_exception=True)
def edit_liscence(request, id):
    try:
        if request.user.has_perm('Customers.change_license'):
            if request.method == 'POST':
                lisence_iD = request.POST.get('license_ID', None)
                reg = request.POST.get('reg_number', None)
                lr_number = request.POST.get('r_number', None)
                lreg_date = request.POST.get('reg_date', None)
                lexp_date = request.POST.get('exp_date', None)
                lowner_lis = request.POST.get('owner_lis', None)
                ltype = request.POST.get('type', None)
                lstate = request.POST.get('state', None)
                lplace = request.POST.get('place', None)

                liscence = customer_model.license.objects.filter(
                    Q(license_id=lisence_iD)).first()

                lis_state = customer_model.federal_state.objects.filter(
                    state_id=lstate).first()

                lis_place = customer_model.placeissue.objects.filter(
                    place_id=lplace).first()

                lis_type = customer_model.licensetype.objects.filter(
                    type_id=ltype).first()

                lis_rec = finance_model.receipt_voucher.objects.filter(
                    rv_id=lr_number)

                lis_owne = customer_model.customer.objects.filter(
                    customer_id=lowner_lis)

                liscence.place_of_issue = lis_place
                liscence.federal_state = lis_state
                liscence.type = lis_type
                liscence.reg_no = reg
                liscence.receipt_voucher.rv_id = lis_rec
                liscence.expired_date = lexp_date
                liscence.created_at = lreg_date
                liscence.owner.customer_id = lis_owne

                liscence.save()
                message = {
                    'isError': False,
                    'title': "Successfully!!!",
                    'type': "success",
                    'Message': 'liscence has Been Updated Succesfully'
                }

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

    return render(request, 'License/edit_model.html')


@login_required(login_url="Login")
def edit_manage(request, id):
    manage_id = request.POST.get('manage_id', None)
    status = request.POST.get('gender', None)

    liscence = customer_model.license.objects.filter(
        Q(license_id=manage_id)).first()

    liscence.status = status

    liscence.save()

    return render(request, 'License/edit_model.html')


@login_required(login_url='Login')
@permission_required('Customers.add_license', raise_exception=True)
def renew_license(request, id):

    # TODO: check permission
    if request.user.has_perm('Customers.add_license'):
        if request.method == 'POST':
            if id is not None:
                license_to_renew = customer_model.license.objects.filter(
                    license_id=id).first()
                if license_to_renew is not None:
                    # check if the license is expired
                    new_expired_year = current_date.replace(
                        year=license_to_renew.expired_date.year+3)
                    rv_number = request.POST.get('rv_number', None)

                    if rv_number is not None:
                        rv_exist = customer_model.license.objects.filter(
                            Q(receipt_voucher__rv_number=rv_number)).exists()
                        if rv_exist:
                            return JsonResponse({
                                'isError': True,
                                'Message': 'Recipt Already Used'
                            })
                        else:
                            if license_to_renew.expired_date <= current_date:
                                license_to_renew.expired_date = new_expired_year
                                license_to_renew.save()
                                return JsonResponse({
                                    'isError': False,
                                    'Message': 'License Renewed Succefully'
                                })
                            else:
                                return JsonResponse({
                                    'isError': True,
                                    'Message': 'License Not Expired',
                                })
                    else:
                        return JsonResponse({
                            'isError': True,
                            'Message': 'Provide an RV Number',
                        })
                else:
                    return JsonResponse({
                        'isError': True,
                        'Message': 'License Not Found',
                    })
            else:
                return JsonResponse({
                    'isError': True,
                    'Message': 'please provide a liecense ID',
                })
