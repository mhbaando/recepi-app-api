from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
# Create your views here.
# Register License


def NewLicense(request):
    context = {
        'pageTitle': 'Register License'
    }
    return render(request, 'License/NewLicense.html', context)

# Re-New License


def ReNewLicense(request):
    context = {
        'pageTitle': 'Renew License'
    }
    return render(request, 'License/ReNewLicense.html', context)
# License Lists


def LicenseLists(request):
    licenselist = [
        {
            'id': 1,
            'lno': 1457812549,
            'ownar': 'Mohamed Omar Hassan',
            'register': '2023/01/20',
            'expire': '2024/01/20',
            'status': 'Active',
        },
        {
            'id': 2,
            'lno': 4579812364,
            'ownar': 'Abdikani Abdullahi Ali',
            'register': '2023/01/20',
            'expire': '2024/01/20',
            'status': 'Active',
        },


    ]

    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    CheckStatus = 'Status' in request.GET
    DataNumber = 10
    Status = "Active"
    SearchQuery = ''

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])
    if CheckStatus:
        Status = request.GET.get('Status')
    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
        licenselist
    else:
        licenselist

    paginator = Paginator(licenselist, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    context = {
        'licenselist': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,

        'pageTitle':  'license Lists',
        'Status': Status,


    }
    return render(request, 'License/LicenseLists.html', context)
