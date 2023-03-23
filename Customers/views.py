from django.shortcuts import render
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse

from Vehicles.plate_converter import shorten
from . import models
from django.contrib.auth.models import Permission
from django.utils.itercompat import is_iterable


from Users.views import sendException, sendTrials
from Vehicles import models as vehilce_model
from Finance import models as financemodel
from datetime import datetime
from Customers.autditory import save_error, save_log

# Create your views here.
# company


@login_required(login_url='Login')
def vew_register_company(request):
    try:
        if request.user.has_perm('Customers.view_company'):
            if request.method == 'GET':
                states = []
                if request.user.is_state or request.user.is_admin and request.user.federal_state is not None:
                    states = customer_model.federal_state.objects.filter(
                        Q(state_id=request.user.federal_state.state_id))
                else:
                    # admins can view all users
                    states = customer_model.federal_state.objects.all()
                context = {
                    'pageTitle': 'Register Company',
                    'states': states,
                }
                return render(request, 'Company/register.html', context)
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not Allowed'
            })
        return render(request, 'Base/403.html')
    except Exception as error:
        save_error(request, error)


#


@login_required(login_url='Login')
def register_company(request):
    try:
        if request.user.has_perm('Customers.add_company'):
            if request.method == 'POST':
                # get data from the request
                c_name = request.POST.get('cname', None)
                c_rnum = request.POST.get('rnumber', None)
                c_webiste = request.POST.get('website', None)
                c_owner = request.POST.get('owner', None)
                c_phone = request.POST.get('phone', None)
                c_email = request.POST.get('email', None)
                c_address = request.POST.get('address', None)
                c_state = request.POST.get('state', None)
                c_logo = request.FILES['logo']
                c_companyDoc = request.FILES['companyDoc']
                c_desc = request.POST.get('desc')

                states = []
                if request.user.is_state or request.user.is_admin and request.user.federal_state is not None:
                    states = customer_model.federal_state.objects.filter(
                        Q(state_id=request.user.federal_state.state_id)).first()
                else:
                    # admins can view all users
                    states = customer_model.federal_state.objects.all()

                if c_name is None or c_rnum is None or c_webiste is None or c_owner is None or c_phone is None or c_email is None or c_address is None or c_state is None or c_desc is None:
                    return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        }
                    )

                if not request.user.is_superuser and request.user.federal_state != states:
                    return JsonResponse({'isError': True, 'Message': 'You cant register another state'})

                selected_satate = customer_model.federal_state.objects.filter(
                    Q(state_id=c_state)).first()

                # find owner by splitn the name and personal id
                found_owner = customer_model.customer.objects.filter(
                    Q(customer_id=c_owner)).first()

                if found_owner is not None:
                    if (c_companyDoc.size > 2097152):
                        return JsonResponse({'isError': True, 'Message': 'you can not  upload more then 1mb'}, status=200)

                    # register new compnay
                    new_company = customer_model.company(
                        company_name=c_name,
                        email=c_email,
                        address=c_address,
                        federal_state=selected_satate,
                        phone=c_phone,
                        logo=c_logo,
                        website=c_webiste,
                        reg_no=c_rnum,
                        document=c_companyDoc,
                        description=c_desc,
                        owner=found_owner,
                        reg_user=request.user
                    )
                    new_company.save()
                    save_log(request, 'Company / Register',
                             f'Waxa uu diwangaliyay ${new_company.company_name}')

                    return JsonResponse({'isError': False, 'Message': 'Company has been successfully Saved'})
                return JsonResponse({'isError': True, 'Message': 'Owner didnt extist'})
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not allowed'
            })
        return render(request, 'Base/403.html')
    except:
        pass
# search


def search_engine(request, search):
    try:
        if request.user.has_perm('Customers.view_company'):

            if request.method == 'GET':
                customers = customer_model.customer.objects.filter(
                    Q(full_name__icontains=search))
                owner = []

                for customer in customers:
                    owner.append([{
                        'owner_name': customer.full_name,
                        'owner_id': customer.personal_id,
                        'owner_pk': customer.customer_id
                    }])

                return JsonResponse({'owner': owner}, status=200)
            else:
                return JsonResponse()
    except Exception as error:
        save_error(request, error)


@login_required(login_url='Login')
def view_company(request):
    if request.user.has_perm('Customers.view_company'):
        CheckSearchQuery = 'SearchQuery' in request.GET
        CheckDataNumber = 'DataNumber' in request.GET
        CheckStatus = 'Status' in request.GET
        Status = 'block'
        SearchQuery = ''
        DataNumber = 10
        companies = []
        context = {
            'pageTitle': 'View Company'
        }

        if not request.user.is_superuser and request.user.federal_state is None:
            return JsonResponse(
                {
                    'isError': True,
                    'title': 'State Error',
                    'type': 'danger',
                    'Message':  'Update your state to view the company'
                }
            )

        if CheckDataNumber:
            DataNumber = int(request.GET['DataNumber'])

        if CheckStatus:
            Status = request.GET.get('Status')

        if CheckSearchQuery:
            SearchQuery = request.GET['SearchQuery']
            # for state user
            if request.user.is_state or request.user.is_admin:
                companies = customer_model.company.objects.filter(federal_state=request.user.federal_state).filter(
                    Q(company_name__icontains=SearchQuery)).order_by('-created_at')
            # for admin users
            else:
                companies = customer_model.company.objects.filter(
                    Q(company_name__icontains=SearchQuery)).order_by('-created_at')
        else:
            if request.user.is_superuser:
                companies = customer_model.company.objects.all().order_by('-created_at')
            else:
                companies = customer_model.company.objects.filter(
                    Q(federal_state=request.user.federal_state)).order_by('-created_at')
            # paginate data

        paginator = Paginator(companies, DataNumber)
        page_number = request.GET.get('page')
        companies_obj = paginator.get_page(page_number)

        # pass company and data number down to the context
        context['total'] = len(companies)
        context['DataNumber'] = DataNumber
        context['companies'] = companies_obj
        context['SearchQuery'] = SearchQuery
        context['Status'] = Status
        save_log(request, 'Company / List ',
                 f'waxa uu booqday company List')
        return render(request, "Company/view_company.html", context)

    return render(request, 'Base/403.html')


@login_required(login_url='Login')
def block_company(request):
    try:
        if request.user.has_perm('Customer.block_company'):
            if request.method == 'POST':

                co_id = request.POST.get('co_id').strip()
                co_desc = request.POST.get('co_desc')
                c_doc = request.FILES['co_doc']
                company = ""
                if co_id is None or co_desc is None or c_doc is None:
                    return JsonResponse({'isError': True, 'Message': 'Bad Request'}, status=400)

                # find the company for admin
                if request.user.is_superuser:
                    company = customer_model.company.objects.filter(
                        Q(company_id=co_id)).first()
                else:
                    # for regular users
                    company = customer_model.company.objects.filter(
                        Q(company_id=co_id), federal_state=request.user.federal_state).first()

                if company is not None:
                    company.is_blocked = True
                    company.document = c_doc
                    company.description = co_desc
                    company.save()
                    # customer.update(is_verified=True,
                    #                 document=c_doc, description=c_desc)

                    save_log(request, 'Cusomer / Active ',
                             f'waxa uu active greyay {company.company_name}')
                    username = request.user.username
                    names = request.user.first_name + ' ' + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Customer / company_block"
                    action = f'Block  A Company {company.company_name}'
                    path = request.path
                    sendTrials(request, username, names,
                               avatar, action, module, path)

                    return JsonResponse({'isError': False, 'Message': 'Company blocked'}, status=200)

                return JsonResponse({'isError': True, 'Message': 'Company not found'}, status=404)

            return render(request, 'Base/403.html')
    except Exception as error:
        save_error(request, error)


# unblocked company

@login_required(login_url='Login')
def unblockcompany(request, id):
    try:
        if request.user.has_perm('Customers.unblock_company'):
            if request.method == 'GET':

                # find the company for admin
                if request.user.is_superuser:
                    company = customer_model.company.objects.filter(
                        Q(company_id=id)).first()
                else:
                    # for regular users
                    company = customer_model.company.objects.filter(
                        Q(company_id=id), federal_state=request.user.federal_state).first()

                if company is not None:
                    company.is_blocked = False
                    company.save()

                    username = request.user.username
                    names = request.user.first_name + ' ' + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Customer / company_unblock"
                    action = f'Un block A Company {company.company_name}'
                    path = request.path
                    sendTrials(request, username, names,
                               avatar, action, module, path)

                    return JsonResponse({'isError': False, 'Message': 'Unblocked Succefully'}, status=200)

                return JsonResponse({'isError': True, 'Message': 'Company not found'}, status=404)

    except Exception as error:
        save_error(request, error)

# end unblock company


@login_required(login_url="Login")
def company_profile(request, id):
    try:
        if request.user.has_perm('Customers.view_company'):

            if request.method == 'GET':
                if id is not None:
                    company = ''
                    all_vehicles = []
                    vehicles = []
                    transfares = []
                    payments = []
                    states = []

                    if request.user.is_superuser:
                        # for admin user
                        company = customer_model.company.objects.filter(
                            Q(company_id=id)).first()
                        states = customer_model.federal_state.objects.all()

                    else:
                        # for state user
                        company = customer_model.company.objects.filter(
                            Q(company_id=id), federal_state=request.user.federal_state).first()
                        states = customer_model.federal_state.objects.filter(
                            Q(state_id=request.user.federal_state.state_id))

                    # doesn't deppend on state
                    all_vehicles = vehilce_model.vehicle.objects.filter(
                        Q(owner=company.owner)).all()

                    transfare = []
                    transfares = vehilce_model.transfare_vehicles.objects.filter(
                        Q(old_owner=company.owner) | Q(new_owner=company.owner)
                    )

                    for tr in transfares:
                        transfare.append({
                            'vehicle': tr.vehicle,
                            'new_owner': tr.new_owner,
                            'old_owner': tr.old_owner,
                            'plate': shorten(tr.vehicle.plate_no.state.state_name, tr.vehicle.plate_no.plate_code, tr.vehicle.plate_no.plate_no),
                            'created_at': tr.created_at.strftime('%d - %B - %Y')
                        })

                    payments = financemodel.receipt_voucher.objects.filter(
                        Q(rv_from=company.owner))

                    if all_vehicles is not None:
                        for vh in all_vehicles:

                            vehicles.append({
                                'vehicle_model': vh.vehicle_model.brand_name,
                                'vin': vh.vin,
                                'year': vh.year,
                                'plate': shorten(vh.plate_no.state.state_name, vh.plate_no.plate_code, vh.plate_no.plate_no) if vh.plate_no else None,
                                'created_at': vh.created_at.strftime('%d - %B - %Y'),
                            })

                    context = {
                        'company': company,
                        'vehicles': vehicles,
                        'transfares': transfare,
                        'payments': payments,
                        'states': states,
                        'pageTitle': 'Company / Profile'
                    }

            return render(request, 'Company/comp_profile.html', context)
        else:
            return JsonResponse({'isError': True, 'Message': 'Provide a customer ID'}, status=400)
    except Exception as error:
        save_error(request, error)


@ login_required(login_url="Login")
def find_company(request, id):
    try:
        if request.user.has_perm('Customers.view_company'):

            if request.method == 'GET':
                if id is not None:
                    company = ''
                    if request.user.is_superuser:
                        # for admin user
                        company = customer_model.company.objects.filter(
                            Q(company_id=id)).values()
                    else:
                        # for state user
                        company = customer_model.company.objects.filter(
                            Q(company_id=id), federal_state=request.user.federal_state).values()

                    return JsonResponse({'isErro': False, 'Message': list(company)}, status=200)
                else:
                    return JsonResponse({'isErro': False, 'Message': 'Company Not Found'}, status=404)
            else:
                return JsonResponse({'isErro': False, 'Message': 'Method Not Allowed'}, status=404)
    except Exception as error:
        save_error(request, error)
    #  update company


@login_required(login_url="Login")
def update_company(request):
    try:
        # check Permission
        if request.user.has_perm("Customers.change_company"):
            company_id = request.POST.get('company_id', None)
            c_name = request.POST.get('cname', None)
            cphone = request.POST.get('cphone', None)
            cemail = request.POST.get('cemail', None)
            caddress = request.POST.get('caddress', None)
            cwebsite = request.POST.get('cwebsite', None)
            cregister = request.POST.get('cregister', None)
            cstate = request.POST.get('cstate', None)

            if company_id is not None:
                company = customer_model.company.objects.filter(
                    company_id=company_id).first()

                if company is not None:
                    if c_name is None or cphone is None or cemail is None or caddress is None or cwebsite is None or cregister is None or cstate is None:
                        return JsonResponse({'isErro': False, 'Message': 'all fields are required'}, status=400)
                    state = customer_model.federal_state.objects.filter(
                        Q(state_id=cstate)).first()

                    company.company_name = c_name
                    company.phone = cphone
                    company.email = cemail
                    company.website = cwebsite
                    company.address = caddress
                    company.reg_no = cregister
                    company.federal_state = state
                    company.save()

                    # for auditory
                    username = request.user.username
                    names = request.user.first_name + ' ' + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Customer / update"
                    action = 'updated a company' + company.company_name
                    path = request.path
                    sendTrials(request, username, names,
                               avatar, action, module, path)
                    return JsonResponse({'isError': False, 'Message': 'company has been updated'}, status=200)
                return JsonResponse({'isErro': True, 'Message': 'Company Not found'})
            return JsonResponse({'isErro': True, 'Message': 'Provide company id'}, status=400)
        return JsonResponse({
            'isError': True,
            'Message': 'you dont have permission to update this compnay'
        })

    except Exception as error:
        username = request.user.username
        name = request.user.first_name + '' + request.user.last_name
        sendException(
            request, username, name, error
        )
        message = {
            'isError': True,
            'Message': 'on Error occurs . please try again or contact system adminstrator'

        }
        return JsonResponse(message, status=200)


@login_required(login_url='Login')
def Searchcustomer(request, search):
    try:
        if request.user.has_perm('Customers.view_company'):
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
                            'owner_pk': searchQuery[xSearch].customer_id,

                        }
                    )
                return JsonResponse({'Message': message}, status=200)
    except Exception as error:
        save_error(request, error)
