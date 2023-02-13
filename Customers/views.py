from django.shortcuts import render, redirect
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse, request

from Users.views import sendException, sendTrials
from datetime import datetime

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
def r_company(request):
    context = {
        'pageTitle': 'R comapny'
    }
    return render(request, 'Company/re.html', context)


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
                Q(firstname__icontains=SearchQuery)).order_by('-created_at')

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

    # pass cutomers and data number down to the context
    context['total'] = len(companies)
    context['DataNumber'] = DataNumber
    context['companies'] = companies_obj
    context['SearchQuery'] = SearchQuery
    # context['Status'] = Status

    return render(request, 'company/view_company.html', context)


# @login_required(login_url='Login')
# def detail_company(request):
#     context = {
#         'pageTitle': 'Company Details'
#     }
#     return render(request, 'company/comp_details.html', context)


@login_required(login_url='Login')
def block_company(request):
    context = {
        'pageTitle': 'block company'
    }
    return render(request, 'company/block_company.html', context)


@login_required(login_url="Login")
def company_profile(request, id):

    context = {
        'pageTitle': 'Company / Profile'
    }

    return render(request, 'Company/comp_profile.html', context)


# customers


@login_required(login_url='Login')
def register_customer(request):
    states = []
    bload_group = customer_model.blood_group.objects.all()
    nationalities = customer_model.countries.objects.all()
    doc_types = customer_model.personal_id_type.objects.all()  # personal id types

    # check the user state
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_id=request.user.federal_state.state_id))
    elif request.user.is_superuser:
        states = customer_model.federal_state.objects.all()
    else:
        states = "No State Found"

    context = {
        'pageTitle': 'Register',
        'bload_group': bload_group,
        'nationalities': nationalities,
        'states': states,
        'doc_types': doc_types
    }

    try:
        # TODO: check permision
        if request.user.has_perm('Customers.add_customer'):
            # check if the request is post
            if request.method == 'POST':
                customerImg = request.FILES["img"]
                dob = request.POST.get('dob', None)
                fName = request.POST.get('fname', None)
                sName = request.POST.get('sname', None)
                mName = request.POST.get('mname', None)
                phone = request.POST.get('phone', None)
                email = request.POST.get('email', None)
                state = request.POST.get('state', None)
                gender = request.POST.get('gender', None)
                foName = request.POST.get('foname', None)
                thName = request.POST.get('thname', None)
                customer_address = request.POST.get('address', None)
                docType = request.POST.get('docType', None)
                personalID = request.POST.get('perid', None)
                bload_group = request.POST.get('bload_group', None)
                nationality = request.POST.get('nationality', None)

                # check data
                if dob is None or fName is None or sName is None or mName is None or phone is None or email is None or state is None or gender is None or foName is None or thName is None or customer_address is None or personalID is None or bload_group is None or nationality is None:

                    return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        },
                    )

                group = customer_model.blood_group.objects.filter(
                    Q(blood_group_id=bload_group)).first()
                docs_type = customer_model.personal_id_type.objects.filter(
                    Q(personal_id=docType)).first()
                nation = customer_model.countries.objects.filter(
                    Q(country_id=nationality)).first()
                selected_satate = customer_model.federal_state.objects.filter(
                    Q(state_id=state)).first()

                if group is None or docs_type is None or nation is None or selected_satate is None:
                    return JsonResponse({'isError': True, 'Message': 'Bad Request'}, status=400)

                if request.user.is_superuser == False and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

                new_customer = customer_model.customer(
                    firstname=fName,
                    middle_name=sName,
                    lastname=thName,
                    fourth_name=foName,
                    mother_name=mName,
                    full_name=f"{fName} {sName} {thName} {foName}",
                    gender=gender,
                    date_of_birth=dob,
                    blood_group=group,
                    personal_id_type=docs_type,
                    nationality=nation,
                    personal_id=personalID,
                    email=email,
                    address=customer_address,
                    federal_state=selected_satate,
                    phone=phone,
                    photo=customerImg,
                    reg_user=request.user,
                )

                new_customer.save()
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Register"
                action = 'Registered A Customer'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'Customer has been successfully Saved'}, status=200)

            # return for get method
            return render(request, 'Customer/register.html', context)
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


@login_required(login_url='Login')
def activate_customer(request):
    if request.method == 'POST':
        try:
            c_personalID = request.POST.get('perosonalID').strip()
            c_desc = request.POST.get('desc')
            c_doc = request.FILES['customerDoc']
            customer = ""
            if c_personalID is None or c_desc is None or c_doc is None:
                return JsonResponse({'isError': True, 'Message': 'Bad Request'}, status=400)

            # find the customer for admin
            if request.user.is_superuser:
                customer = customer_model.customer.objects.filter(
                    Q(personal_id=c_personalID)).first()
            else:
                # for regular users
                customer = customer_model.customer.objects.filter(
                    Q(personal_id=c_personalID), federal_state=request.user.federal_state).first()

            if customer is not None:
                customer.is_verified = True
                customer.document = c_doc
                customer.description = c_desc
                customer.save()
                # customer.update(is_verified=True,
                #                 document=c_doc, description=c_desc)
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Activate"
                action = f'Activated A Customer {customer.full_name}'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)

                return JsonResponse({'isError': False, 'Message': 'Customer Verified'}, status=200)

            return JsonResponse({'isError': True, 'Message': 'Custmer not found'}, status=404)

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
def customer_list(request):
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    CheckStatus = 'Status' in request.GET

    Status = 'Verified'
    SearchQuery = ''
    DataNumber = 10
    customers = []
    context = {
        'pageTitle': 'List'
    }

    if not request.user.is_superuser and request.user.federal_state is None:
        return JsonResponse(
            {
                'isError': True,
                'title': 'State Error',
                'type': 'danger',
                'Message':  'Update your state to view the customers'
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
            customers = customer_model.customer.objects.filter(federal_state=request.user.federal_state
                                                               ).filter(Q(firstname__icontains=SearchQuery)).order_by('-created_at')
        # for admin users
        else:
            customers = customer_model.customer.objects.filter(
                Q(firstname__icontains=SearchQuery)).order_by('-created_at')

    else:

        if request.user.is_superuser:
            customers = customer_model.customer.objects.all().order_by('-created_at')
        else:
            customers = customer_model.customer.objects.filter(
                Q(federal_state=request.user.federal_state)).order_by('-created_at')

    # paginate data
    paginator = Paginator(customers, DataNumber)
    page_number = request.GET.get('page')
    customers_obj = paginator.get_page(page_number)

    # pass cutomers and data number down to the context
    context['total'] = len(customers)
    context['DataNumber'] = DataNumber
    context['customers'] = customers_obj
    context['SearchQuery'] = SearchQuery
    # context['Status'] = Status

    return render(request, 'Customer/view.html', context)


@ login_required(login_url="Login")
def customer_profile(request, id):
    if request.method == 'GET':
        if id is not None:
            customer = ''
            if request.user.is_superuser:
                # for admin user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id)).first()
            else:
                # for state user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id), federal_state=request.user.federal_state).first()

            context = {
                'customer': customer,
                'pageTitle': 'Profile'
            }

            return render(request, 'Customer/profile.html', context)
        else:
            return JsonResponse({'isError': True, 'Message': 'Provide a customer ID'}, status=400)
