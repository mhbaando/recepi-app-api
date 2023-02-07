from django.shortcuts import render, redirect
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from Users import models as user_model
from django.db.models import Q
from django.http import JsonResponse

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
    return render(request, 'Company/register.html', context)


# registration company


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

    # check if the request is post
    if request.method == 'POST':

        # TODO: check permision
        customerImg = request.FILES["img"]
        dob = request.POST.get('dob', None)
        fName = request.POST.get('fname', None)
        sName = request.POST.get('sName', None)
        mName = request.POST.get('mName', None)
        phone = request.POST.get('phone', None)
        email = request.POST.get('email', None)
        state = request.POST.get('state', None)
        gender = request.POST.get('gender', None)
        foName = request.POST.get('foName', None)
        thName = request.POST.get('thName', None)
        customerDoc = request.FILES["customerDoc"]
        address = request.POST.get('address, None')
        docType = request.POST.get('docType', None)
        personalID = request.POST.get('perid', None)
        bload_group = request.POST.get('bload_group', None)
        nationality = request.POST.get('nationality', None)

        # check data
        # if dob is None or fName is None or sName is None or mName is None or phone is None or email is None or state is None or gender is None or foName is None or thName is None or address is None or personalID is None or bload_group is None or nationality is None:
        #     return JsonResponse(
        #         {
        #             'isError': True,
        #             'title': 'Validate Error',
        #             'type': 'danger',
        #             'Message':  'Fill All Required Fields'
        #         }
        #     )

        customer_model.customer.objects.create(
            firstname=fName,
            middle_name=sName,
            lastname=thName,
            fourth_name=foName,
            mother_name=mName,
            gender=gender,
            date_of_birth=dob,
            blood_group=bload_group,
            personal_id_type=docType,
            nationality=nationality,
            personal_id=personalID,
            email=email,
            address=address,
            federal_state=state,
            phone=phone,
            document=customerDoc,
            photo=customerImg,
            reg_user=request.user.id,
        )

        return redirect('customer_list')

    return render(request, 'Customer/register.html', context)


@login_required(login_url='Login')
def activate_customer(request):

    context = {
        'pageTitle': 'Activate'
    }

    return render(request, 'Customer/activate.html', context)


@login_required(login_url='Login')
def customer_list(request):

    context = {
        'pageTitle': 'List'
    }
    return render(request, 'Customer/view.html', context)


@login_required(login_url="Login")
def customer_profile(request, id):

    context = {
        'pageTitle': 'Profile'
    }

    return render(request, 'Customer/profile.html', context)
