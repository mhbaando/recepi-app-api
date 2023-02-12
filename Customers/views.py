from django.shortcuts import render, redirect
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse, request

from Users.views import sendException, sendTrials


# Create your views here.
# company


@login_required(login_url='Login')
def register_company(request):

    states = []
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_name=request.user.federal_state))
    else:
        states = customer_model.federal_state.objects.all()

    context = {
        'pageTitle': 'Register Company',
        'states': states
    }

    # modal fucntion

    # registration company
    try:
        # TODO: check permision
        if request.user.has_perm('Company.add_company'):
            # check if the request is post
            if request.method == 'POST':

                cname = request.POST.get('cname', None)
                rnumber = request.POST.get('rnumber', None)
                website = request.POST.get('website', None)
                owner = request.POST.get('phone', None)
                # contact info
                phone = request.POST.get('phone', None)
                email = request.POST.get('email', None)
                address = request.POST.get('address', None)
                state = request.POST.get('state', None)
                # identification info
                logo = request.FILES["logo"]
                document = request.FILES["companyDoc"]

                # check data
                if cname is None or rnumber is None or website is None or owner is None or phone is None or email is None or state is None or address is None:

                    return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        }
                    )

                selected_satate = customer_model.federal_state.objects.filter(
                    Q(state_id=state)).first()

                if request.user.is_state or request.user.is_admin and request.user.federal_state is None:
                    return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

                new_company = customer_model.customer(
                    comapnyname=cname,
                    registrationnumber=rnumber,
                    website=website,
                    owner=owner,
                    phone=phone,
                    email=email,
                    address=address,
                    logo=logo,
                    document=document,
                    federal_state=selected_satate,
                    reg_user=request.user,
                )

                new_company.save()
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Company / Register"
                action = 'Registered A Company'
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                # return for post method
                return JsonResponse({'isError': False, 'Message': 'Company has been successfully Saved'}, status=200)

            # return for get method
            return render(request, 'Company/register.html', context)
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
    DataNumber = 10
    SearchQuery = ''
    Company_list = []

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    # Demo data
    Company_list = [
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'UnBlocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'UnBlocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'UnBlocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'UnBlocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'UnBlocked',
            'action': 'Edit',
        },
        {
            'Name': 'Al taqwa',
            'ownner': 'Mohamed ali ahmed',
            'Register': '5645647-875788',
            'Phone': '7865876876',
            'status': 'Blocked',
            'action': 'Edit',
        },
    ]
    paginator = Paginator(Company_list, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'pageTitle': 'view_Company',
        'page_obj': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,
        "company_list": Company_list,
    }
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
                customerDoc = request.FILES["customerDoc"]
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
                        }
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
                    document=customerDoc,
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

    context = {
        'pageTitle': 'Activate'
    }

    return render(request, 'Customer/activate.html', context)


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

    context = {
        'pageTitle': 'Profile'
    }

    return render(request, 'Customer/profile.html', context)
