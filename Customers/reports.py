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


@login_required(login_url="Login")
def Searchcustomer(request, search):
    try:
        if request.user.has_perm("Customers.view_company"):
            if request.method == "GET":
                searchQuery = customer_model.customer.objects.filter(
                    Q(full_name__icontains=search)
                    | Q(personal_id__icontains=search)
                    | Q(phone__icontains=search)
                )

                message = []
                for xSearch in range(0, len(searchQuery)):
                    message.append(
                        {
                            "label": f"{searchQuery[xSearch].full_name} - {searchQuery[xSearch].personal_id}",
                            "value": f"{searchQuery[xSearch].full_name} - {searchQuery[xSearch].personal_id}",
                            "customer_id": searchQuery[xSearch].customer_id,
                        }
                    )
                return JsonResponse({"Message": message}, status=200)
    except Exception as error:
        save_error(request, error)


# display report of the seleceted customer


@login_required(login_url="Login")
def customer_report(request, id):
    if request.method == "GET":
        customer = ""
        license = ""
        # check requtes user state
        if (request.user.is_admin or request.user.is_state) and request.user.federal_state is None:
            return JsonResponse({"isError": True, "Message": "Update your state"})

        if request.user.is_superuser:
            customer = customer_model.customer.objects.filter(
                customer_id=id).first()
            license = customer_model.license.objects.filter(
                Q(owner=customer)).first()
        else:
            customer = customer_model.customer.objects.filter(
                Q(federal_state=request.user.federal_state), customer_id=id
            ).first()
            license = customer_model.license.objects.filter(
                Q(owner=customer), federal_state=request.user.federal_state).first()

        if customer is not None:
            save_log(
                request,
                "Report / Customer",
                f"waxa uu raadiayay customerka leh {id} gaan",
            )

            found_customer = {
                'full_name': customer.full_name,
                'mother_name': customer.mother_name,
                'personal_id': customer.personal_id,
                'gender': customer.gender,
                'bload_group': customer.blood_group.blood_group_name,
                'nationality': customer.nationality.country_name,
                'email': customer.email,
                'phone': customer.phone,
                'dob': customer.date_of_birth.strftime('%d / %B / %Y'),
                'address': customer.address,
                'state': customer.federal_state.state_name,
                'reg_user': customer.reg_user.email,
                'status': customer.show_verify()['verified_status'],
                'status_class': customer.show_verify()['verified_color']
            }

            found_license = ''
            if license is not None:
                found_license = {
                    'license_no': license.reg_no,
                    'state': license.federal_state.state_name,
                    'expdate': license.expired_date.strftime('%d / %B / %Y'),
                    'type': license.type.type,
                    'issue_date': license.modified_at.strftime('%d / %B /%Y'),
                    'place_issue': license.place_of_issue.place_name,
                    'status': license.status.capitalize()
                }
            found_companies = []
            companies = customer_model.company.objects.filter(
                Q(owner=customer)).all()

            if companies is not None:
                for company in companies:
                    found_companies.append({
                        'name': company.company_name,
                        'phone': company.phone,
                        'email': company.email,
                        'address': company.address,
                        'state': company.federal_state.state_name,
                        'reg_no': company.reg_no,
                        'status': company.show_status()['verified_status'],
                        'reg_date': company.created_at.strftime('%d / %B /%Y')
                    })
            found_vehicles = []
            vehicles = vehicle_model.vehicle.objects.filter(
                Q(owner=customer)).all()

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

            found_transfer = []
            transfers = vehicle_model.transfare_vehicles.objects.filter(
                Q(old_owner=customer) | Q(new_owner=customer))

            if transfers is not None:
                for transfer in transfers:
                    found_transfer.append({
                        'model_year': f"{transfer.vehicle.vehicle_model}-{transfer.vehicle.year}",
                        'old_owner': transfer.old_owner.full_name,
                        'new_owner': transfer.new_owner.full_name,
                        'rv_no': transfer.rv_number,
                        'reason': transfer.transfare_reason,
                        'plate_no': plate_converter.shorten(transfer.vehicle.plate_no.state.state_name, transfer.vehicle.plate_no.plate_code.code_name, transfer.vehicle.plate_no.plate_no) if transfer.vehicle.plate_no else 'No Plate Assigned',
                        'date': transfer.created_at.strftime('%d / %B / %Y'),
                        'count': len(transfers)
                    })
            found_payments = []
            payments = finance_model.receipt_voucher.objects.filter(
                Q(rv_from=customer)).all()

            if payments is not None:
                for payment in payments:
                    found_payments.append({
                        'rv_no': payment.rv_number,
                        'rv_from': payment.rv_from.full_name,
                        'personal_id': payment.rv_from.personal_id,
                        'amount': payment.rv_amount,
                        'reason': payment.reason,
                        'date': payment.created_at.strftime('%d / %B / %Y')
                    })

            return JsonResponse({
                'isError': False,
                'customer': found_customer,
                'found_license': found_license,
                'companies': found_companies,
                'vehicles': found_vehicles,
                'transfer': found_transfer,
                'payments': found_payments
            })

        return JsonResponse({"isError": True, "Message": "Customer Not Found"})

    return JsonResponse({"isError": True, "Message": "Method Not Allowed"})
