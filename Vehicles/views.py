from django.shortcuts import render,redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .models import vehicle
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from .forms import Vehicleform
from django.contrib import messages

# Create your views here.


# @login_required


def register_vehicle(request):
    form = Vehicleform()
    if request.method == "POST":
        form = Vehicleform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "a Vehicle was registerd")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form}
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
    vehicles=vehicle.objects.all()
    context = {"vehicles": vehicles}
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











