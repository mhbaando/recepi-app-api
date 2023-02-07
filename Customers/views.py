from django.shortcuts import render
from Customers import models as customer_model
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from Users import models as user_model
from django.db.models import Q
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
