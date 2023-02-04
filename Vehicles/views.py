from django.shortcuts import render
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator

# Create your views here.


# @login_required
def register_vehicle(request):
    context = {"pageTitle": "Register vehicle"}
    return render(request, "Vehicles/register_vehicle.html", context)


# @login_required
def assign_aplate(request):
    context = {"pageTitle": "Assign Aplate"}
    return render(request, "Vehicles/asign_plate.html", context)


# @login_required
def tranfer(request):
    context = {"pageTitle": "Transfer Vehicle"}
    return render(request, "Vehicles/transfer.html", context)


def view_vehicle(request):
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 10
    SearchQuery = ''
    Vehicle_list=[]


    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    # Demo data
    Vehicle_list = [
        {
            'Model_brand': 'Toyota',
            'ownner': 'samiya cilmi maxamud',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'lambargini',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
         {
            'Model_brand': 'lenova',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
       {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'dahir cilmi sheikh',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
         {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'ali isaq farax',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'ahmed farax ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
         {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'UnBlocked',
            'action':'Edit',
        },
         {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
         {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
        {
            'Model_brand': 'Toyota',
            'ownner': 'asho ali ahmed',
            'vin': 'v-875788',
            'plate': 'pt-65757',
            'status':'Blocked',
            'action':'Edit',
        },
    ]

    paginator = Paginator(Vehicle_list, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'pageTitle': 'View Vehicles',
        'page_obj': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,
        "Vehicle_list":Vehicle_list,
    }
    return render(request, 'Vehicles/veiw_vehicles.html', context)





