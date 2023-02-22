from django.shortcuts import render, redirect
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse, request
from django.core.exceptions import ValidationError

from Users.views import sendException, sendTrials
from datetime import datetime
import json
# Create your views here.
# company


@login_required(login_url='Login')
def register_company(request):

    #  read all states for the users
    states = []
    customers = []

    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
    else:
        # admins can view all users
        states = customer_model.federal_state.objects.all()

    if not request.user.is_superuser and request.user.federal_state is None:
        return JsonResponse({
            'isError': True,
            'title': 'Validate Error',
            'type': 'danger',
            'Message':  'Update your state to register a compnay'
        })

    if request.user.is_superuser:
        customers = customer_model.customer.objects.all()

    else:
        customers = customer_model.customer.objects.filter(
            Q(federal_state__state_name=request.user.federal_state))

    if request.method == 'POST':
        try:
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
                return JsonResponse({'isError': True, 'Message': 'You cant register another state'}, status=401)

            selected_satate = customer_model.federal_state.objects.filter(
                Q(state_id=c_state)).first()

            # find owner by splitn the name and personal id
            c_owner_id = c_owner.split('-')[1].strip()
            found_owner = customer_model.customer.objects.filter(
                Q(personal_id=c_owner_id)).first()

            if found_owner is not None:

                if (c_companyDoc.size > 1000000):
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

                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Register"
                action = f'Registered A Company {c_name} at {datetime.now()}'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'Company has been successfully Saved'}, status=200)
            else:
                return JsonResponse({'isError': True, 'Message': 'Owner didnt extist'}, status=404)
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
        'pageTitle': 'Register Company',
        'states': states,
        'customers': customers
    }
    return render(request, 'Company/register.html', context)


# search
def search_engine(request, search):
    if request.method == 'GET':
        customers = customer_model.customer.objects.filter(
            Q(full_name__icontains=search))
        owner = []

        for customer in customers:
            owner = [{
                'owner_name': customer.full_name,
                'owner_id': customer.personal_id
            }]

        return JsonResponse({'owner': owner}, status=200)
    else:
        return JsonResponse()


@login_required(login_url='Login')
def register_customer(request):
    states = []
    bload_group = customer_model.blood_group.objects.all()
    nationalities = customer_model.countries.objects.all()
    doc_types = customer_model.personal_id_type.objects.all()  # personal id types

    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
    else:
        states = customer_model.federal_state.objects.all()

    context = {
        'pageTitle': 'Register',
        'bload_group': bload_group,
        'nationalities': nationalities,
        'states': states,
        'doc_types': doc_types
    }

    return render(request, 'Customer/register.html', context)


@login_required(login_url='Login')
def view_company(request):

    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    CheckStatus = 'Status' in request.GET

    Status = 'block'
    SearchQuery = ''
    DataNumber = 10
    companies = []
    context = {
        'pageTitle': 'company-views'
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
        # verified = True if Status == 'Verified'else False

        # for state user
        if request.user.is_state or request.user.is_admin:
            companies = customer_model.company.objects.filter(federal_state=request.user.federal_state
                                                              ).filter(Q(firstname__icontains=SearchQuery)).order_by('-created_at')
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

    return render(request, 'Company/view_company.html', context)


@login_required(login_url='Login')
def block_company(request):
    if request.method == 'POST':
        try:
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
                company. is_blocked = True
                company.document = c_doc
                company.description = co_desc
                company.save()
                # customer.update(is_verified=True,
                #                 document=c_doc, description=c_desc)
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


@login_required(login_url="Login")
def company_profile(request, id):

    if request.method == 'GET':
        if id is not None:
            company = ''
            if request.user.is_superuser:
                # for admin user
                company = customer_model.company.objects.filter(
                    Q(company_id=id)).first()
            else:
                # for state user
                company = customer_model.company.objects.filter(
                    Q(company_id=id), federal_state=request.user.federal_state).first()

            context = {
                'company': company,
                'pageTitle': 'Company / Profile'
            }

            return render(request, 'Company/comp_profile.html', context)
        else:
            return JsonResponse({'isError': True, 'Message': 'Provide a customer ID'}, status=400)

           # edit company


@ login_required(login_url="Login")
def find_company(request, id):

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

    #  update company


@ login_required(login_url="Login")
def update_company(request):
    try:
        company_id = request.POST.get('company_id', None)
        c_name = request.POST.get('cname', None)
        c_website = request.POST.get('sname', None)
        c_address = request.POST.get('thname', None)
        c_regisno = request.POST.get('foname', None)

        if company_id is not None:
            company = customer_model.company.objects.filter(
                company_id=company_id).first()

            if company is not None:
                if (c_name is None or c_website is None or c_address is None or c_regisno is None):
                    return JsonResponse({'isErro': False, 'Message': 'all fields are required'}, status=400)
                company.company_name = c_name
                company.website = c_website
                company.address = c_address
                company.reg_no = c_regisno
                company.save()
                # for auditory

                username = request.user.username
                names = request.user.company_name + ' ' + request.user.website
                avatar = str(request.user.avatar)
                module = "Customer / update"
                action = 'updated a company' + company.company_name
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                return JsonResponse({'isError': False, 'Message': 'company has been updated'}, status=404)
            return JsonResponse({'isErro': False, 'Message': 'company feild is required'}, status=400)

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

                }
            )
        return JsonResponse({'Message': message}, status=200)


# file limited upload
def file_size(value):  # add this to some file where you can import it from
    limit = 2 * 1024 * 1024
    if value.size > limit:
        raise ValidationError('File too large. Size should not exceed 2 MiB.')
