import json

from django.contrib.auth.decorators import login_required
from django.core import serializers
from django.core.paginator import Paginator
from django.db.models import Q
from django.db.models.fields.json import json
from django.http import JsonResponse
from django.shortcuts import redirect, render
from django.core.serializers.json import DjangoJSONEncoder

from . import models as customer_model
from .autditory import save_error, save_log
from Vehicles import models as vehicle_model, plate_converter
from Finance import models as finance_model


@login_required(login_url="Login")
def report_home(request):
    context = {"pageTitle": "Reports"}

    return render(request, "reports/report.html", context)


# company search

@login_required(login_url="Login")
def searchcompany(request, search):
    try:
        if request.method == "GET":
            searchQuery = customer_model.company.objects.filter(
                Q(company_name__icontains=search)
                | Q(reg_no__icontains=search)
                | Q(phone__icontains=search)
            )

            message = []
            for xSearch in range(0, len(searchQuery)):
                message.append(
                    {
                        "label": f"{searchQuery[xSearch].company_name} - {searchQuery[xSearch]. reg_no}",
                        "value": f"{searchQuery[xSearch].company_name} - {searchQuery[xSearch]. reg_no}",
                        "company_id": searchQuery[xSearch].company_id,
                    }
                )
            return JsonResponse({"Message": message}, status=200)
    except Exception as error:
        save_error(request, error)


# company report

@login_required(login_url="Login")
def company_report(request, id):
    if request.method == "GET":
        company = ""
        vehicle = ""
        # check requtes user state
        if not request.user.is_superuser and request.user.federal_state is not None:
            return JsonResponse({"isError": True, "Message": "Update your state"})

        if request.user.is_superuser:
            company = customer_model.company.objects.filter(
                customer_id=id).first()
            vehicle = vehicle.vehicle_model.objects.filter(
                Q(owner=company)).first()
        else:
            company = customer_model.company.objects.filter(
                Q(federal_state=request.user.federal_state), company_id=id
            ).first()

        if company is not None:
            save_log(
                request,
                "Report / Customer",
                f"waxa uu raadiayay company leh {id} gaan",
            )

            found_company = {
                'company_name': company.company_name,
                'email': company.email,
                'address': company.address,
                'phone': company.phone,
                'status': company.show_verify()['verified_status'],
                'website': company.website,
                'regno': company.reg_no,
                'owner': company.owner,
                'regdate': company.modified_at,
                'regno': company.reg_user,
                'state': company.federal_state.state_name,
                'reg_user': company.reg_user.email,
                'status_class': company.show_verify()['verified_color']
            }

            found_vehicles = []
            vehicles = vehicle_model.vehicle.objects.filter(
                Q(owner=company)).all()

            if vehicles is not None:
                for vehicle in vehicles:

                    found_vehicles.append({
                        'vehicle_id': vehicle.vehicle_id,
                        'model_year': f'{vehicle.vehicle_model.brand_name} - {vehicle.year}',
                        'vin': vehicle.vin,
                        'engine_no': vehicle.enginer_no,
                        'color': vehicle.color.color_name,
                        'hp': vehicle.hp,
                        'plate_no': plate_converter.shorten(vehicle.plate_no.state.state_name, vehicle.plate_no.plate_code.code_name, vehicle.plate_no.plate_no) if vehicle.plate_no else 'No Plate Assigned'
                    })

            return JsonResponse({
                'isError': False,
                'company': found_company,
                'vehicles': found_vehicles
            })

        return JsonResponse({"isError": True, "Message": "Company Not Found"})
    return JsonResponse({"isError": True, "Message": "Method Not Allowed"})
