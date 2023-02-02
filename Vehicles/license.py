from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
# Create your views here.
# Register License
from datetime import date, datetime
from django.db.models import Q, OuterRef, Exists
from Finance import models as finance_model
from Customers import models as customer_model
current_date = date.today()
years_to_add = current_date.year + 4
expired_year = current_date.replace(year=years_to_add)


def NewLicense(request):
    FederalState = customer_model.federal_state.objects.all()
    context = {
        'FederalState': FederalState,
        'expired_year': expired_year,
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


# Search Query
def Searchinvoice(request, search):
    if request.method == 'GET':
        searchQuery = finance_model.receipt_voucher.objects.filter(
            Q(rv_number__icontains=search))
        message = []
        for xSearch in range(0, len(searchQuery)):
            message.append(
                {
                    'label': f"{searchQuery[xSearch].rv_number}",
                    'value': f"{searchQuery[xSearch].rv_number}",
                    'username': searchQuery[xSearch].rv_number,
                    'rv_id': searchQuery[xSearch].rv_id,

                }
            )
        return JsonResponse({'Message': message}, status=200)


def customer_info(request, id):
    if request.method == 'GET':
        try:
            vouchers = finance_model.receipt_voucher.objects.get(
                rv_number=id)
            license = customer_model.license.objects.filter(
                license_id=id).exists
            if license:
                license = customer_model.license.objects.get(
                    license_id=id)
            message = []
            message.append(
                {
                    'ownar_name': f"{vouchers.rv_from.full_name}",
                    'mother_name': f"{vouchers.rv_from.mother_name}",
                    'personal_id': f"{vouchers.rv_from.personal_id}",
                    'personal_id_type': f"{vouchers.rv_from.personal_id_type.personal_name}",
                    'license': f"{license.reg_no}" if license else 'no Lecenses'
                }
            )
            return JsonResponse({'Message': message}, status=200)
        except Exception as error:
            username = request.user.username
            name = request.user.first_name + ' ' + request.user.last_name

            # Save Errors
            # sendException(
            #     request, username, name, error)
            message = {
                'title': "Server Error",
                'type': "error",
                'isError': True,
                'Message': f"On Error Occurs. { str(error)}. Please try again or contact system administrator"
            }
            return JsonResponse(message, status=200)
