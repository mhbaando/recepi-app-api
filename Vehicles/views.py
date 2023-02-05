from django.shortcuts import render,redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .models import vehicle,plate,transfare_vehicles,model_brand,color,cylinder
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from Customers.models import countries,customer
from django.contrib import messages
from .forms import Vehicleform,Transferform,Plateform

# Create your views here.


# @login_required


# class Register_create(CreateView):
#     model=vehicle
#     fields='__all__'
#     success_url=reverse_lazy('veiw-vehicle')
#     template_name='Vehicles/register_vehicle.html'

def register_vehicle(request):
    form = Vehicleform()
    if request.method == "POST":
        form = Vehicleform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Vehicle was registered successfully")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form,'pageTitle': 'Register vehicle'}
    return render(request, "Vehicles/register_vehicle.html", context)



# @login_required
# def assign_aplate(request):
#     context = {"pageTitle": "Assign Aplate"}
#     return render(request, "Vehicles/asign_plate.html", context)
def assign_plate(request):
    form = Plateform()
    if request.method == "POST":
        form = Plateform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "assigned anew plate to a new vehicle")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form,'pageTitle': 'Assign Aplate'}
    return render(request, "Vehicles/asign_plate.html", context)


# @login_required
# def tranfer(request):
#     context = {"pageTitle": "Transfer Vehicle"}
#     return render(request, "Vehicles/transfer.html", context)


def tranfercreate(request):
    transfer=transfare_vehicles.objects.all()[:4]
    form = Transferform()
    if request.method == "POST":
        form = Transferform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "anew transfer happened ")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form,"transfer":transfer,'pageTitle': 'Transfer Vehicle'}
    return render(request, "Vehicles/transfer.html", context)

# class Assign_create(CreateView):
#     model=plate
#     fields='__all__'
#     success_url=reverse_lazy('veiw-vehicle')
#     template_name='Vehicles/asign_plate.html'


def view_vehicle(request):
    vehicles=vehicle.objects.all()
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 10
    SearchQuery = ''
    if CheckDataNumber:
       DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
      SearchQuery = request.GET['SearchQuery']
    else:
         pass

 
    paginator = Paginator(vehicles, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'pageTitle': 'View Vehicles',
         'page_obj': page_obj,
         'SearchQuery': SearchQuery,
         'DataNumber': DataNumber,
         "vehicles":vehicles
         }
    return render(request, 'Vehicles/veiw_vehicles.html', context)
   

# def view_vehicle(request):
#     CheckSearchQuery = 'SearchQuery' in request.GET
#     CheckDataNumber = 'DataNumber' in request.GET
#     DataNumber = 10
#     SearchQuery = ''
#     Vehicle_list=[]


#     if CheckDataNumber:
#         DataNumber = int(request.GET['DataNumber'])

#     if CheckSearchQuery:
#         SearchQuery = request.GET['SearchQuery']
#     else:
#         pass

 
#     paginator = Paginator(Vehicle_list, DataNumber)

#     page_number = request.GET.get('page')
#     page_obj = paginator.get_page(page_number)
#     context = {
#         'pageTitle': 'View Vehicles',
#         'page_obj': page_obj,
#         'SearchQuery': SearchQuery,
#         'DataNumber': DataNumber,
#         "Vehicle_list":Vehicle_list,
#     }
#     return render(request, 'Vehicles/veiw_vehicles.html', context)











