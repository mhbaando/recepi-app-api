# customers
from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import redirect, render

from Customers import models as customer_model
from Finance import models as financemodel
from Users.views import sendException, sendTrials
from Vehicles import models as vehicle_model

from . import models as customer_model


@login_required(login_url="Login")
def register_customer(request):
    states = []
    bload_group = customer_model.blood_group.objects.all()
    nationalities = customer_model.countries.objects.all()
    doc_types = customer_model.personal_id_type.objects.all()  # personal id types

    # check the user state
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_id=request.user.federal_state.state_id)
        )
    elif request.user.is_superuser:
        states = customer_model.federal_state.objects.all()
    else:
        states = "No State Found"

    context = {
        "pageTitle": "Register",
        "bload_group": bload_group,
        "nationalities": nationalities,
        "states": states,
        "doc_types": doc_types,
    }

    try:
        # TODO: check permision
        if request.user.has_perm("Customers.add_customer"):
            # check if the request is post
            if request.method == "POST":
                customerImg = request.FILES["img"]
                dob = request.POST.get("dob", None)
                fName = request.POST.get("fname", None)
                sName = request.POST.get("sname", None)
                mName = request.POST.get("mname", None)
                phone = request.POST.get("phone", None)
                email = request.POST.get("email", None)
                state = request.POST.get("state", None)
                gender = request.POST.get("gender", None)
                foName = request.POST.get("foname", None)
                thName = request.POST.get("thname", None)
                customer_address = request.POST.get("address", None)
                docType = request.POST.get("docType", None)
                personalID = request.POST.get("perid", None)
                bload_group = request.POST.get("bload_group", None)
                nationality = request.POST.get("nationality", None)

                # check data
                if (
                    dob is None
                    or fName is None
                    or sName is None
                    or mName is None
                    or phone is None
                    or email is None
                    or state is None
                    or gender is None
                    or foName is None
                    or thName is None
                    or customer_address is None
                    or personalID is None
                    or bload_group is None
                    or nationality is None
                ):
                    return JsonResponse(
                        {
                            "isError": True,
                            "title": "Validate Error",
                            "type": "danger",
                            "Message": "Fill All Required Fields",
                        },
                    )

                group = customer_model.blood_group.objects.filter(
                    Q(blood_group_id=bload_group)
                ).first()
                docs_type = customer_model.personal_id_type.objects.filter(
                    Q(personal_id=docType)
                ).first()
                nation = customer_model.countries.objects.filter(
                    Q(country_id=nationality)
                ).first()
                selected_satate = customer_model.federal_state.objects.filter(
                    Q(state_id=state)
                ).first()

                if (
                    group is None
                    or docs_type is None
                    or nation is None
                    or selected_satate is None
                ):
                    return JsonResponse(
                        {"isError": True, "Message": "Bad Request"}, status=400
                    )

                if (
                    request.user.is_superuser == False
                    and request.user.federal_state is None
                ):
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Not allowed to register with out state",
                        },
                        status=401,
                    )

                new_customer = customer_model.customer(
                    firstname=fName,
                    middle_name=sName,
                    lastname=thName,
                    fourth_name=foName,
                    mother_name=mName,
                    full_name=f"{fName} {sName} {thName} {foName}",
                    gender=gender,
                    date_of_birth=dob,
                    blood_group=group,
                    personal_id_type=docs_type,
                    nationality=nation,
                    personal_id=personalID,
                    email=email,
                    address=customer_address,
                    federal_state=selected_satate,
                    phone=phone,
                    photo=customerImg,
                    reg_user=request.user,
                )

                new_customer.save()
                username = request.user.username
                names = request.user.first_name + " " + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Register"
                action = "Registered A Customer"
                path = request.path
                sendTrials(request, username, names, avatar, action, module, path)
                # return for post method
                return JsonResponse(
                    {
                        "isError": False,
                        "Message": "Customer has been successfully Saved",
                    },
                    status=200,
                )

            # return for get method
            return render(request, "Customer/register.html", context)
        else:
            return redirect("un_authorized")
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + " " + request.user.last_name
        # register the error
        sendException(request, username, name, error)
        message = {
            "isError": True,
            "Message": "On Error Occurs . Please try again or contact system administrator",
        }
        return JsonResponse(message, status=200)


@login_required(login_url="Login")
def activate_customer(request):
    if request.method == "POST":
        try:
            c_personalID = request.POST.get("perosonalID").strip()
            c_desc = request.POST.get("desc")
            c_doc = request.FILES["customerDoc"]

            if c_doc.size > 1000000:
                return JsonResponse(
                    {
                        "isError": True,
                        "Message": "File Uppload exceeded Maximum size of 2MB",
                    }
                )

            customer = ""
            if c_personalID is None or c_desc is None or c_doc is None:
                return JsonResponse(
                    {"isError": True, "Message": "Bad Request"}, status=400
                )

            # find the customer for admin
            if request.user.is_superuser:
                customer = customer_model.customer.objects.filter(
                    Q(personal_id=c_personalID)
                ).first()
            else:
                # for regular users
                customer = customer_model.customer.objects.filter(
                    Q(personal_id=c_personalID),
                    federal_state=request.user.federal_state,
                ).first()

            if customer is not None:
                customer.is_verified = True
                customer.document = c_doc
                customer.description = c_desc
                customer.save()
                # customer.update(is_verified=True,
                #                 document=c_doc, description=c_desc)
                username = request.user.username
                names = request.user.first_name + " " + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Activate"
                action = f"Activated A Customer {customer.full_name}"
                path = request.path
                sendTrials(request, username, names, avatar, action, module, path)

                return JsonResponse(
                    {"isError": False, "Message": "Customer Verified"}, status=200
                )

            return JsonResponse(
                {"isError": True, "Message": "Custmer not found"}, status=404
            )

        except Exception as error:
            username = request.user.username
            name = request.user.first_name + " " + request.user.last_name
            # register the error
            sendException(request, username, name, error)
            message = {
                "isError": True,
                "Message": "On Error Occurs . Please try again or contact system administrator",
            }
            return JsonResponse(message, status=200)


@login_required(login_url="Login")
def customer_list(request):
    CheckSearchQuery = "SearchQuery" in request.GET
    CheckDataNumber = "DataNumber" in request.GET
    CheckStatus = "Status" in request.GET

    Status = "Verified"
    SearchQuery = ""
    DataNumber = 10
    customers = []
    context = {"pageTitle": "List"}

    if not request.user.is_superuser and request.user.federal_state is None:
        return JsonResponse(
            {
                "isError": True,
                "title": "State Error",
                "type": "danger",
                "Message": "Update your state to view the customers",
            }
        )

    if CheckDataNumber:
        DataNumber = int(request.GET["DataNumber"])

    if CheckStatus:
        Status = request.GET.get("Status")

    if CheckSearchQuery:
        SearchQuery = request.GET["SearchQuery"]
        # verified = True if Status == 'Verified'else False

        # for state user
        if request.user.is_state or request.user.is_admin:
            customers = (
                customer_model.customer.objects.filter(
                    federal_state=request.user.federal_state
                )
                .filter(Q(firstname__icontains=SearchQuery))
                .order_by("-created_at")
            )
        # for admin users
        else:
            customers = customer_model.customer.objects.filter(
                Q(firstname__icontains=SearchQuery)
            ).order_by("-created_at")

    else:
        if request.user.is_superuser:
            customers = customer_model.customer.objects.all().order_by("-created_at")
        else:
            customers = customer_model.customer.objects.filter(
                Q(federal_state=request.user.federal_state)
            ).order_by("-created_at")

    # paginate data
    paginator = Paginator(customers, DataNumber)
    page_number = request.GET.get("page")
    customers_obj = paginator.get_page(page_number)

    # pass cutomers and data number down to the context
    context["total"] = len(customers)
    context["DataNumber"] = DataNumber
    context["customers"] = customers_obj
    context["SearchQuery"] = SearchQuery
    # context['Status'] = Status

    return render(request, "Customer/view.html", context)


@login_required(login_url="Login")
def customer_profile(request, id):
    customer_exist = customer_model.customer.objects.filter(Q(customer_id=id)).exists()

    if not customer_exist:
        return render(request, "./Base/403.html")

    bload_group = customer_model.blood_group.objects.all()
    nationalities = customer_model.countries.objects.all()
    doc_types = customer_model.personal_id_type.objects.all()  # personal id types
    states = []
    stateappre = [
        {"name": "Banaadir", "appreviation": "BN"},
        {"name": "Hirshabeelle", "appreviation": "HR"},
        {"name": "Galmudug", "appreviation": "GM"},
        {"name": "Puntland", "appreviation": "PN"},
        {"name": "Koonfur Galbeed", "appreviation": "KG"},
        {"name": "Jubba land", "appreviation": "JL"},
        {"name": "Somali land", "appreviation": "SL"},
    ]

    # check the user state
    if request.user.is_state and request.user.federal_state is not None:
        states = customer_model.federal_state.objects.filter(
            Q(state_id=request.user.federal_state.state_id)
        )
    elif request.user.is_superuser:
        states = customer_model.federal_state.objects.all()
    else:
        states = "No State Found"

    if request.method == "GET":
        if id is not None:
            customer = ""
            if request.user.is_superuser:
                # for admin user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id)
                ).first()

            else:
                # for state user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id), federal_state=request.user.federal_state
                ).first()
            vehicles = []
            vehicle = vehicle_model.vehicle.objects.filter(Q(owner=customer))
            license = customer_model.license.objects.filter(Q(owner=customer)).first()

            transfare = vehicle_model.transfare_vehicles.objects.filter(
                Q(old_owner=customer) | Q(new_owner=customer)
            )

            payments = financemodel.receipt_voucher.objects.filter(Q(rv_from=customer))

            companies = customer_model.company.objects.filter(Q(owner=customer))

            for vh in vehicle:
                stateap = ""
                for stateapp in stateappre:
                    if vh.plate_no is not None:
                        if vh.plate_no.state.state_name == stateapp["name"]:
                            stateap = stateapp["appreviation"]

                vehicles.append(
                    {
                        "vehicle_model": vh.vehicle_model,
                        "year": vh.year,
                        "vin": vh.vin,
                        "created_at": vh.created_at,
                        "plate": f"{stateap}-{vh.plate_no.plate_code}-{vh.plate_no.plate_no}"
                        if vh.plate_no is not None
                        else None,
                    }
                )

            context = {
                "customer": customer,
                "pageTitle": "Profile",
                "bload_group": bload_group,
                "nationalities": nationalities,
                "states": states,
                "vehicles": vehicles,
                "license": license,
                "transfares": transfare,
                "payments": payments,
                "companies": companies,
            }

            return render(request, "Customer/profile.html", context)
        else:
            return JsonResponse(
                {"isError": True, "Message": "Provide a customer ID"}, status=400
            )


@login_required(login_url="Login")
def find_customer(request, id):
    if request.method == "GET":
        if id is not None:
            customer = ""
            if request.user.is_superuser:
                # for admin user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id)
                ).values()
            else:
                # for state user
                customer = customer_model.customer.objects.filter(
                    Q(customer_id=id), federal_state=request.user.federal_state
                ).values()

            return JsonResponse(
                {"isErro": False, "Message": list(customer)}, status=200
            )
        else:
            return JsonResponse(
                {"isErro": False, "Message": "Customer Not Found"}, status=404
            )
    else:
        return JsonResponse(
            {"isErro": False, "Message": "Method Not Allowed"}, status=404
        )


@login_required(login_url="Login")
def update_customer(request):
    try:
        customer_id = request.POST.get("customer_id", None)
        f_name = request.POST.get("fname", None)
        m_name = request.POST.get("sname", None)
        th_name = request.POST.get("thname", None)
        fo_name = request.POST.get("foname", None)
        full_name = request.POST.get("full_name", None)
        mother_name = request.POST.get("mname", None)
        dob = request.POST.get("dob", None)
        personal_id = request.POST.get("perid", None)
        gender = request.POST.get("gender", None)
        group = request.POST.get("bload_group", None)
        nationality = request.POST.get("nationality", None)
        phone = request.POST.get("phone", None)
        email = request.POST.get("email", None)
        address = request.POST.get("address", None)
        state = request.POST.get("state", None)

        if customer_id is not None:
            customer = customer_model.customer.objects.filter(
                customer_id=customer_id
            ).first()
            state = customer_model.federal_state.objects.filter(state_id=state).first()
            bload_group = customer_model.blood_group.objects.filter(
                blood_group_id=group
            ).first()
            nation = customer_model.countries.objects.filter(
                country_id=nationality
            ).first()

            if customer is not None:
                if (
                    f_name is None
                    or m_name is None
                    or th_name is None
                    or fo_name is None
                    or full_name is None
                    or mother_name is None
                    or dob is None
                    or personal_id is None
                    or gender is None
                    or group is None
                    or nationality is None
                    or phone is None
                    or email is None
                    or address is None
                    or state is None
                ):
                    return JsonResponse(
                        {"isErro": False, "Message": "All feilds are required"},
                        status=400,
                    )

                customer.firstname = f_name
                customer.middle_name = m_name
                customer.lastname = th_name
                customer.fourth_name = fo_name
                customer.mother_name = mother_name
                customer.full_name = full_name
                customer.gender = gender
                customer.date_of_birth = dob
                customer.blood_group = bload_group
                customer.nationality = nation
                customer.personal_id = personal_id
                customer.email = email
                customer.address = address
                customer.federal_state = state
                customer.phone = phone
                customer.save()

                # for auditory
                username = request.user.username
                names = request.user.first_name + " " + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Customer / Update"
                action = "Updated A Customer " + customer.full_name
                path = request.path
                sendTrials(request, username, names, avatar, action, module, path)
                return JsonResponse(
                    {"isError": False, "Message": "Customer has been updated"},
                    status=200,
                )
            return JsonResponse(
                {"isErro": False, "Message": "Customer Not Found"}, status=404
            )
        return JsonResponse(
            {"isErro": False, "Message": "customer id is required"}, status=400
        )

    except Exception as error:
        username = request.user.username
        name = request.user.first_name + " " + request.user.last_name
        # register the error
        sendException(request, username, name, error)
        message = {
            "isError": True,
            "Message": "On Error Occurs . Please try again or contact system administrator",
        }
        return JsonResponse(message, status=200)
