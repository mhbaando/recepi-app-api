from django.contrib.auth.decorators import login_required
from django.db.models import Q
from django.db.models.fields.json import json
from django.http import JsonResponse
from django.shortcuts import render
from django.core.serializers.json import DjangoJSONEncoder

from Customers.autditory import save_error, save_log
from Vehicles import models as vehicle_model, plate_converter


@login_required(login_url="Login")
def report_home(request):
    context = {"pageTitle": "Reports"}

    return render(request, "reports/report.html", context)


@login_required(login_url="Login")
def Searchvehicle(request, search):
    try:
        if request.user.has_perm("vehicles.view_vehicle"):
            if request.method == "GET":
                searchQuery = vehicle_model.vehicle.objects.filter(
                    Q(enginer_no__icontains=search) | Q(
                        owner__full_name__icontains=search) | Q(vin__icontains=search) | Q(plate_no__plate_no__icontains=search)
                )

                message = []
                for xSearch in range(0, len(searchQuery)):
                    message.append(
                        {
                            "label": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin} - {searchQuery[xSearch].enginer_no}- {searchQuery[xSearch].plate_no.plate_no}",
                            "value": f"{searchQuery[xSearch].owner.full_name} - {searchQuery[xSearch].vin} -{searchQuery[xSearch].enginer_no} - {searchQuery[xSearch].plate_no.plate_no}",
                            "vehicle_id": searchQuery[xSearch].vehicle_id,
                        }
                    )
                return JsonResponse({"Message": message})
            return JsonResponse({
                'isError': True,
                'Message': 'Method Not Allowed'
            })
        return render(request, 'Base/403.html')
    except Exception as error:
        save_error(request, error)


# display report of the seleceted Vehicle
@login_required(login_url="Login")
def vehicle_report(request, id):
    if request.method == "GET":
        vehicle = ""
        transfare = []
        if request.user.is_superuser:
            vehicle = vehicle_model.vehicle.objects.filter(
                vehicle_id=id).first()

        else:
            vehicle = vehicle_model.vehicle.objects.filter(
                vehicle_id=id).first()

        if vehicle is not None:
            save_log(
                request,
                "Report / Vehicle",
                f"waxa uu raadiayay vehicleka leh {id} gaan",
            )

            found_vehicle = {
                'vehicle_owner': vehicle.owner.full_name,
                'vehicle_brand': vehicle.vehicle_model.brand_name,
                'year': vehicle.year,
                'origin': vehicle.origin.country_name,
                'color': vehicle.color.color_name,
                'weight': vehicle.weight,
                'hp': vehicle.hp,
                'engine_no': vehicle.enginer_no,
                'passenger_seats': vehicle.pessenger_seat,
                'cylinder': vehicle.cylinder.cylinder_name,
                'rv_number': vehicle.rv_number,
                'vin': vehicle.vin,
                'reg_user': vehicle.reg_user.email,
                "plate_no": plate_converter.shorten(vehicle.plate_no.state.state_name, vehicle.plate_no.plate_code.code_name, vehicle.plate_no.plate_no) if vehicle.plate_no else 'No Plate Assigned',


            }
            found_transfer = []
            transfare = vehicle_model.transfare_vehicles.objects.filter(
                Q(vehicle_id=id)).all()

            if transfare is not None:
                for transfer in transfare:
                    found_transfer.append({
                        'modal': f'{transfer.vehicle.vehicle_model}-{transfer.vehicle.year}',
                        'old_owner_cus': transfer.old_owner.full_name,
                        'new_owner_cust': transfer.new_owner.full_name,
                        'rv_number': transfer.rv_number,
                        'reason_tran': transfer.transfare_reason,
                        'plate_number': plate_converter.shorten(transfer.vehicle.plate_no.state.state_name, transfer.vehicle.plate_no.plate_code.code_name, transfer.vehicle.plate_no.plate_no) if vehicle.plate_no else 'No Plate Assigned',
                        'date_time': transfer.created_at.strftime('%d / %B / %Y'),
                        'count_tran': len(found_transfer)
                    })

            return JsonResponse({
                'isError': False,
                "vehicle": found_vehicle,
                "transfare_r": found_transfer,


            })

        return JsonResponse({"isError": True, "Message": "Vehicle Not Found"})

    return JsonResponse({"isError": True, "Message": "Method Not Allowed"})
