from django.shortcuts import render,redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .models import vehicle,color,cylinder,model_brand
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from .forms import Vehicleform
from django.contrib import messages
from Customers.models import customer,countries
# Create your views here.


# @login_required


def register_vehicle(request):
    vehicle_model1=model_brand.objects.all()
    color1=color.objects.all()
    origin1=countries.objects.all()
    cylinder1=cylinder.objects.all()
    owner1=customer.objects.all()

    if request.method=="POST":
        a=request.post['vehicle_model']
        b=request.POST['year']
        c=request.POST['origin']
        d=request.POST['color']
        e=request.POST['cylinder']
        f=request.POST['hp']
        g=request.POST['pessenger_seat']
        h=request.POST['vin']
        i=request.POST['enginer_no']
        j=request.POST['rv_number']
        k=request.POST['owner']
        vehicles=model_brand.objects.filter(name=a).first()
        colors=color.objects.filter(name=b).first()
        origin=countries.objects.filter(name=c).first()
        cylenders=cylinder.objects.filter(name=d).first()
        owner=customer.objects.filter(name=e).first()
        vehicle.objects.create(vehicles=vehicles,year=b,origin=c,colors=colors,cylinders=e,hp=f,pessenger_seat=g,vin=h,enginer_no=i,rv_number=j,owner=k)
    
    else:
            messages.error(request, "error accured")
    context = {"vehicles":vehicles,"colors":color1,"origin":origin1,"cylinders":cylinder1,"owner":owner1}
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











