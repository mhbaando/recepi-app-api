from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
# Create your views here.
# company


def register_company(request):
    context = {
        'pageTitle': 'register company'
    }
    return render(request, 'Company/register.html', context)


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


def detail_company(request):
    context = {
        'pageTitle': 'detail company'
    }
    return render(request, 'company/comp_details.html', context)


def block_company(request):
    context = {
        'pageTitle': 'block company'
    }
    return render(request, 'company/block_company.html', context)


def profile(request):
    return render(request, 'company/comp_details.html')


# customers
def register_customer(request):

    context = {
        'pageTitle': 'Register'
    }

    return render(request, 'Customer/register.html', context)


def activate_customer(request):

    context = {
        'pageTitle': 'Activate'
    }

    return render(request, 'Customer/activate.html', context)
