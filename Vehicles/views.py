from django.shortcuts import render, redirect
from django.shortcuts import render, redirect
from django.http import JsonResponse
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from .models import vehicle, plate, transfare_vehicles,model_brand, color, cylinder
from django.views.generic.edit import CreateView
from django.urls import reverse_lazy
from Customers.models import countries, customer, blood_group
from django.contrib import messages
from .forms import Vehicleform, Transferform, Plateform
from datetime import datetime
from Vehicles.models import vehicle

from Finance.models import receipt_voucher
from django.db.models import Q


# Create your views here.





# class Register_create(CreateView):
#     model=vehicle
#     fields='__all__'
#     success_url=reverse_lazy('veiw-vehicle')
#     template_name='Vehicles/register_vehicle.html'

# def register_vehicle(request):
#     form = Vehicleform()
#     if request.method == "POST":
#         form = Vehicleform(request.POST)
#         if form.is_valid():
#             form.save()
#             messages.success(request, "Vehicle was registered successfully")
#             return redirect("veiw-vehicle")
#         else:
#             messages.error(request, "error accured")
#     context = {"form": form,'pageTitle': 'Register vehicle'}
#     return render(request, "Vehicles/register_vehicle.html", context)


# def register_vehicle(request):
#     vehicle_model1=model_brand.objects.all()
#     color1=color.objects.all()
#     origin1=countries.objects.all()
#     cylinder1=cylinder.objects.all()
#     owner1=customer.objects.all()

#     if request.method=="POST":
#         a=request.POST['vehicle_model']
#         b=request.POST['year']
#         c=request.POST['origin']
#         d=request.POST['color']
#         e=request.POST['cylinder']
#         f=request.POST['hp']
#         g=request.POST['pessenger_seat']
#         h=request.POST['vin']
#         i=request.POST['enginer_no']
#         j=request.POST['rv_number']
#         k=request.POST['owner']
#         vehicles=model_brand.objects.filter(name=a).first()
#         colors=color.objects.filter(name=b).first()
#         origin=countries.objects.filter(name=c).first()
#         cylenders=cylinder.objects.filter(name=d).first()
#         owner=customer.objects.filter(name=e).first()
#         vehicle.objects.create(vehicles=vehicles,year=b,origin=c,color=color1,cylinders=e,hp=f,pessenger_seat=g,vin=h,enginer_no=i,rv_number=j,owner=k)

#     else:
#             messages.error(request, "error accured")
#     context = {"vehicles":vehicle_model1,"colors":color1,"origin":origin1,"cylinders":cylinder1,"owner":owner1}
#     return render(request, "Vehicles/register_vehicle.html", context)


@login_required(login_url="Login")
def register_vehicle(request):
    vehicle_models = model_brand.objects.all()
    colors = color.objects.all()
    origins = countries.objects.all()
    cylinders = cylinder.objects.all()
    owners = customer.objects.all()
    year = []

    for i in range(1960, datetime.now().year):
        year.append(i)

    year.reverse()

    # if request.method == "POST":
    #     n = request.POST.get("vehicle_model")
    #     new_color = request.POST.get("color")
    #     n_origin = request.POST.get("origin")
    #     n_cylinder = request.POST.get('cylinder')
    #     nowner = request.POST.get('owner')
    #     new_year = request.POST.get('year')
    #     new_vin = request.POST.get('vin')
    #     new_weight = request.POST.get('weight')
    #     new_hp = request.POST.get('hp')
    #     new_pessenger_seat = request.POST.get('pessenger_seat')
    #     new_rv_number = request.POST.get('rv_number')

    #     rv = receipt_voucher.objects.filter(Q(rv_num=new_rv_number))

    #     check_used_rv = vehicle.objects.filter(Q(rv_num=new_rv_number))

    #     if rv is not None:
    #         owner = rv.rv_from

    #     else:
    #         # error handling
    #         pass
    #     vehiclemodel = model_brand.objects.filter(brand_name=n).first()
    #     colo = color.objects.filter(color_name=new_color).first()
    #     oro = countries.objects.filter(country_name=n_origin).first()
    #     cyle = cylinder.objects.filter(cylinder_name=n_cylinder).first()

    #     rv_num = receipt_voucher.objects.get(rv_number=new_rv_number)
    #     ow = rv_num.rv_from

    #     vehicle.objects.create(
    #         vehiclemodel=vehiclemodel,
    #         colo=colo, oro=oro, cyle=cyle, ow=ow, year=new_year, vin=new_vin, weight=new_weight, hp=new_hp, pessenger_seat=new_pessenger_seat, rv_number=new_rv_number)

    #     messages.success(request, "a new vehicle registerered")
    #     return redirect("veiw-vehicles")
    # else:
    #     messages.error(request, "error occured")
    context = {"vehicle_models": vehicle_models, "colors": colors, "origins": origins,
               "cylenders": cylinders,"owners":owners, 'year': year, "pageTitle": 'Register vehicle'}

    try:
        # TODO: check permision
          if request.user.has_perm('Vehicles.add_vehicle'):
            # check if the request is post
            if request.method == 'POST':
                model_brand= request.POST.get('model_brand', None)
                color= request.POST.get('color', None)
                origin = request.POST.get('origin', None)
                year = request.POST.get('year', None)
                cylinder = request.POST.get('cylinder', None)
                hp = request.POST.get('hp', None)
                weight=request.POST.get('weight', None)
                passenger_seats = request.POST.get('passenger_seats', None)
                registration_number = request.POST.get('registration_number', None)
                engine_number = request.POST.get('engine_number', None)

                # check data
                # if dob is None or fName is None or sName is None or mName is None or phone is None or email is None or state is None or gender is None or foName is None or thName is None or customer_address is None or personalID is None or bload_group is None or nationality is None:

                return JsonResponse(
                        {
                            'isError': True,
                            'title': 'Validate Error',
                            'type': 'danger',
                            'Message':  'Fill All Required Fields'
                        }
                    )

            # model_bra=model_brand.objects.filter(
            #         Q(model_brand_id=model_brand)).first()
            colors=color.objects.filter(
                    Q(color_id=color)).first()
               
           
           

                # if group is None or docs_type is None or nation is None or selected_satate is None:
                #     return JsonResponse({'isError': True, 'Message': 'Bad Request'}, status=400)

                # if request.user.is_state or request.user.is_admin and request.user.federal_state is None:
                #     return JsonResponse({'isError': True, 'Message': 'Not allowed to register with out state'}, status=401)

            new_vehicle = vehicle(
                    model=model_brand,
                    color=color,
                    cylinder=cylinder,
                    year=year,
                    origin=origin,
                    Hp=hp,
                  
                )

            new_vehicle.save()
                # username = request.user.username
                # names = request.user.first_name + ' ' + request.user.last_name
                # avatar = str(request.user.avatar)
                # module = "Customer / Register"
                # action = 'Registered A Customer'
                # path = request.path
                # sendTrials(request, username, names,
                #            avatar, action, module, path)
                # return for post method
            return JsonResponse({'isError': False, 'Message': 'Customer has been successfully Saved'}, status=200)

            # return for get method
            
    
    except:
        pass
    #     else:
    #    return redirect('un_authorized')
    #     except Exception as error:
    #     username = request.user.username
    #     name = request.user.first_name + ' ' + request.user.last_name
    #     # register the error
    #     sendException(
    #         request, username, name, error)
    #     message = {
    #         'isError': True,
    #         'Message': 'On Error Occurs . Please try again or contact system administrator'
    #     }
    #     return JsonResponse(message, status=200)


    return render(request, "Vehicles/register_vehicle.html", context)   

# @login_required
# def assign_aplate(request):
#     context = {"pageTitle": "Assign Aplate"}
#     return render(request, "Vehicles/asign_plate.html", context)
@login_required(login_url="Login")
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
    context = {"form": form, 'pageTitle': 'Assign Aplate'}
    return render(request, "Vehicles/asign_plate.html", context)


# @login_required
# def tranfer(request):
#     context = {"pageTitle": "Transfer Vehicle"}
#     return render(request, "Vehicles/transfer.html", context)

@login_required(login_url="Login")
def tranfercreate(request):
    transfer = transfare_vehicles.objects.all()[:5]
    form = Transferform()
    if request.method == "POST":
        form = Transferform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "anew transfer happened ")
            return redirect("veiw-vehicle")
        else:
            messages.error(request, "error accured")
    context = {"form": form, "transfer": transfer,
               'pageTitle': 'Transfer Vehicle'}
    return render(request, "Vehicles/transfer.html", context)

# class Assign_create(CreateView):
#     model=plate
#     fields='__all__'
#     success_url=reverse_lazy('veiw-vehicle')
#     template_name='Vehicles/asign_plate.html'

@login_required(login_url="Login")
def view_vehicle(request):
    vehicles = vehicle.objects.all()
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
               "vehicles": vehicles
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


@login_required(login_url="Login")
def vehicle_profile(request, pk):
    # vehic_id=vehicle.objects.get(id=pk)
    # vehicles=vehicle.objects.filter(id=vehic_id).first()


    context = {
        'pageTitle': 'Profile'
    }

    return render(request, 'Vehicles/vehicle_profile.html', context)








