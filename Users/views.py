import datetime
import json
import sys
import traceback

import httpagentparser
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.hashers import check_password
from django.contrib.auth.models import Group, Permission
from django.contrib.contenttypes.models import ContentType
from django.core.paginator import Paginator
from django.db.models import Count, Q
from django.db.models.functions import ExtractMonth
from django.http import JsonResponse
from django.shortcuts import redirect, render

from Customers import models as customer_model
# Create your views here.
from Vehicles import models as vehicle_model

from . import models


@login_required(login_url="Login")
def Dashboard(request):
    vehicle_count = vehicle_model.vehicle.objects.all().count()
    license_count = customer_model.license.objects.all().count()
    customer_count = customer_model.customer.objects.all().count()
    company_count = customer_model.company.objects.all().count()

    licenses = customer_model.license.objects.all()
    license_type = customer_model.licensetype.objects.all()

    type_count = {}
    for ltype in license_type:
        type_count[ltype.type] = 0

    for liecense in licenses:
        type_count[liecense.type.type] += 1

    customers = customer_model.customer.objects.all().order_by("-created_at")[:5]

    context = {
        "pageTitle": "Dashboard",
        "vehicle_count": vehicle_count,
        "license_count": license_count,
        "customer_count": customer_count,
        "company_count": company_count,
        "type_count": type_count,
        "customers": customers,
    }
    return render(request, "dashboard.html", context)


# chart dashboard
@login_required(login_url="Login")
def get_chart_data(request):
    vehicles = (
        vehicle_model.vehicle.objects.annotate(month=ExtractMonth("created_at"))
        .values("month")
        .annotate(count=Count("vehicle_id"))
        .values("month", "count")
    )

    context = {"vehicles": list(vehicles)}
    return JsonResponse(context)


def Login(request):
    # Checking if the user is logged in
    if request.user.is_authenticated == False:
        # Checking if the send request
        if request.method == "POST":
            email = request.POST.get("Email").lower()
            password = request.POST.get("Password")
            # create instance from the user
            user = authenticate(email=email, password=password)
            check = models.Users.objects.filter(email=email)
            if len(check) > 0:
                is_active = check_password(password, check[0].password)
                username = check[0].username
                avatar = str(check[0].avatar)
                name = check[0].first_name + " " + check[0].last_name
            else:
                is_active = False
            # check if user created
            if user is not None:
                login(request, user)
                action = name + " logged into the System"
                module = "Users Module"
                path = request.path
                sendTrials(request, username, name, avatar, action, module, path)

                return redirect("Dashboard")

            else:
                if is_active:
                    return render(
                        request,
                        "Auth/login.html",
                        {"Message": "Your account is Inactive. Contact to the office"},
                    )
                else:
                    return render(
                        request,
                        "Auth/login.html",
                        {"Message": "Email or Password is invalid"},
                    )

        return render(request, "Auth/login.html", {"pageTitle": "Login"})
    else:
        return redirect("Dashboard")


def Logout(request):
    username = request.user.username
    name = request.user.first_name + " " + request.user.last_name
    avatar = str(request.user.avatar)
    module = "Users Module"
    action = name + " Logged out the System"
    path = request.path
    sendTrials(request, username, name, avatar, action, module, path)
    logout(request)
    return redirect("Login")


def LoggedOut(request):
    return render(request, "Base/logoged_out.html")


def sendTrials(
    request, username, name, avatar, action, module, path, model="", brand=""
):
    username = username
    name = name
    avatar = avatar
    ip = request.META.get("REMOTE_ADDR")
    get_client_agent = request.META["HTTP_USER_AGENT"]
    try:
        detect_os = httpagentparser.detect(get_client_agent)["os"]["name"]
    except KeyError:
        detect_os = get_client_agent
    try:
        browser = httpagentparser.detect(get_client_agent)["browser"]["name"]
    except KeyError:
        browser = get_client_agent
    action = action
    module = module
    user_agent = str(ip) + ","
    user_agent += str(detect_os) + "," if brand == "" else brand + ","
    user_agent += browser if model == "" else model
    audit_trails = models.AuditTrials(
        Avatar=avatar,
        Name=name,
        Username=username,
        Actions=action,
        path=path,
        Module=module,
        operating_system=detect_os if brand == "" else brand,
        ip_address=ip,
        browser=browser if model == "" else model,
        user_agent=user_agent,
    )

    audit_trails.save()

    return {
        "title": "Audit Trials Saved Successfully!!",
    }


def PreviewDate(date_string, is_datetime, add_time=True):
    if is_datetime:
        new_date = date_string
        if add_time:
            date_string = (
                new_date.strftime("%a")
                + ", "
                + new_date.strftime("%b")
                + " "
                + str(new_date.day)
                + ", "
                + str(new_date.year)
                + "  "
                + new_date.strftime("%I")
                + ":"
                + new_date.strftime("%M")
                + ":"
                + new_date.strftime("%S")
                + " "
                + new_date.strftime("%p")
            )
        else:
            date_string = (
                new_date.strftime("%a")
                + ", "
                + new_date.strftime("%b")
                + " "
                + str(new_date.day)
                + ", "
                + str(new_date.year)
            )
    else:
        date_string = str(date_string)
        date_string = date_string.split("-")

        new_date = datetime(
            int(date_string[0]), int(date_string[1]), int(date_string[2])
        )

        date_string = (
            new_date.strftime("%a")
            + ", "
            + new_date.strftime("%b")
            + " "
            + str(new_date.day)
            + ", "
            + str(new_date.year)
        )

    return date_string


def sendException(request, username, name, error, avatar="", model="", brand=""):
    username = username
    Name = name
    ip = request.META.get("REMOTE_ADDR")
    get_client_agent = request.META["HTTP_USER_AGENT"]
    try:
        detect_os = httpagentparser.detect(get_client_agent)["os"]["name"]
    except KeyError:
        detect_os = get_client_agent
    try:
        browser = httpagentparser.detect(get_client_agent)["browser"]["name"]
    except KeyError:
        browser = get_client_agent
    trace_err = traceback.format_exc()
    Expected_error = str(sys.exc_info()[0])
    field_error = str(sys.exc_info()[1])
    line_number = str(sys.exc_info()[-1].tb_lineno)
    user_agent = str(ip) + ","
    user_agent += str(detect_os) + "," if brand == "" else brand + ","
    user_agent += browser if model == "" else model
    error_logs = models.ErrorLogs(
        Avatar=str(request.user.avatar) if avatar == "" else avatar,
        Name=Name,
        Username=username,
        ip_address=ip,
        browser=browser if model == "" else model,
        Expected_error=Expected_error,
        field_error=field_error,
        trace_back=str(trace_err),
        line_number=line_number,
        user_agent=user_agent,
    )

    error_logs.save()

    return {
        "error": str(error),
        "isError": True,
        "title": "An error occurred please contact us",
    }


# Add Users
@login_required(login_url="Login")
def Users(request):
    if request.user.has_perm("Users.add_users"):
        states = customer_model.federal_state.objects.all()
        context = {"pageTitle": "Add New User", "states": states}
        return render(request, "Users/add_user.html", context)
    else:
        return render(request, "Base/403.html")


# Users List
@login_required(login_url="Login")
def UsersList(request):
    if request.user.has_perm("Users.view_users"):
        CheckSearchQuery = "SearchQuery" in request.GET
        CheckDataNumber = "DataNumber" in request.GET
        DataNumber = 10
        SearchQuery = ""
        UsersList = []
        states = customer_model.federal_state.objects.all()

        if CheckDataNumber:
            DataNumber = int(request.GET["DataNumber"])

        if CheckSearchQuery:
            SearchQuery = request.GET["SearchQuery"]
            UsersList = models.Users.objects.filter(
                Q(username__icontains=SearchQuery)
                | Q(email__icontains=SearchQuery)
                | Q(first_name__icontains=SearchQuery)
                | Q(last_name__icontains=SearchQuery)
                | Q(phone__icontains=SearchQuery),
                Q(is_superuser=True) | Q(is_admin=True),
                is_active=True,
            )
        else:
            UsersList = models.Users.objects.all()

        paginator = Paginator(UsersList, DataNumber)

        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)

        Pages = paginator.get_elided_page_range(
            page_obj.number, on_each_side=0, on_ends=1
        )

        context = {
            "page_obj": page_obj,
            "SearchQuery": SearchQuery,
            "DataNumber": DataNumber,
            "TotalUsers": len(UsersList),
            "Pages": Pages,
            "pageTitle": "Users List",
            "states": states,
        }

        return render(request, "Users/user_lists.html", context)
    else:
        return render(request, "Base/403.html")


# Employee List
@login_required(login_url="Login")
def CustomersList(request):
    if request.user.has_perm("Users.view_users"):
        CheckSearchQuery = "SearchQuery" in request.GET
        CheckDataNumber = "DataNumber" in request.GET
        DataNumber = 10
        SearchQuery = ""
        UsersList = []

        if CheckDataNumber:
            DataNumber = int(request.GET["DataNumber"])

        if CheckSearchQuery:
            SearchQuery = request.GET["SearchQuery"]
            UsersList = models.Users.objects.filter(
                Q(username__icontains=SearchQuery)
                | Q(email__icontains=SearchQuery)
                | Q(first_name__icontains=SearchQuery)
                | Q(last_name__icontains=SearchQuery)
                | Q(phone__icontains=SearchQuery),
                is_staff=True,
                is_superuser=False,
            )
        else:
            UsersList = models.Users.objects.filter(is_staff=True, is_superuser=False)

        paginator = Paginator(UsersList, DataNumber)

        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)

        Pages = paginator.get_elided_page_range(
            page_obj.number, on_each_side=0, on_ends=1
        )

        context = {
            "page_obj": page_obj,
            "SearchQuery": SearchQuery,
            "DataNumber": DataNumber,
            "TotalUsers": len(UsersList),
            "Pages": Pages,
            "pageTitle": "Employee List",
        }

        return render(request, "Users/employee_list.html", context)
    else:
        return render(request, "Base/403.html")


# Manage Users
@login_required(login_url="Login")
def ManageUsers(request, action):
    try:
        # action : Holds the action to be performed

        # TODO
        # Check the action to be performed
        # First check if the request matches your need [POST,GET. etc]
        # Then check if the user has the required permission

        if action == "AddNewUser":
            if request.method == "POST":
                if request.user.has_perm("Users.add_users"):
                    Type = request.POST.get("type")
                    fname = request.POST.get("fname")
                    lname = request.POST.get("lname")
                    phone = request.POST.get("phone")
                    email = request.POST.get("email").lower()
                    gender = request.POST.get("gender")
                    state = request.POST.get("state", None)

                    federal_state = ""
                    if state is not None:
                        federal_state = customer_model.federal_state.objects.filter(
                            state_id=state
                        ).first()

                    try:
                        image = request.FILES["image"]
                    except KeyError:
                        image = None

                    authorized_types = ["Admin", "Superuser", "State"]
                    authorized_gender = ["Male", "Female"]

                    if fname == "null" or fname is None or fname == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please enter first name",
                            }
                        )

                    if lname == "null" or lname is None or lname == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please enter last name",
                            }
                        )

                    if phone == "null" or phone is None or phone == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please enter phone number",
                            }
                        )
                    if email == "null" or email is None or email == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please enter email",
                            }
                        )

                    if Type == "null" or Type is None or Type == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please select a type",
                            }
                        )

                    if Type not in authorized_types:
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Invalid Type",
                            }
                        )

                    if gender == "null" or gender is None or gender == "":
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please select a gender",
                            }
                        )

                    if gender not in authorized_gender:
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Invalid Gender",
                            }
                        )

                    if image is None:
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "Please select an image to upload",
                            }
                        )

                    extention = image.name.split(".")[-1]
                    extension_types = ["JPEG", "jpeg", "JPG", "jpg", "png", "PNG"]

                    if not extention in extension_types:
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "This "
                                + image.name
                                + "  does not support image extentions.Please upload Image",
                            }
                        )

                    if image.size > 2621440:
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": image.name + "  file is more than 2mb size",
                            }
                        )

                    if models.Users.objects.filter(email=email).exists():
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": email + " already exists",
                            }
                        )

                    if models.Users.objects.filter(phone=phone).exists():
                        return JsonResponse(
                            {
                                "isError": True,
                                "title": "Validate Error",
                                "type": "warning",
                                "Message": "This Phone already exists",
                            }
                        )

                    is_state = True if Type == "State" else False
                    is_admins = True if Type == "Admin" else False
                    is_supers = True if Type == "Superuser" else False

                    if Type in ["Admin", "State"] and request.user.has_perm(
                        "Users.add_users"
                    ):
                        if (
                            federal_state is None
                            and is_state
                            or federal_state is None
                            and is_admins
                        ):
                            return JsonResponse(
                                {
                                    "isError": True,
                                    "title": "Validate Error",
                                    "type": "danger",
                                    "Message": "select state",
                                }
                            )

                        try:
                            username = models.generateUsername()
                            User = models.Users(
                                first_name=fname.strip(),
                                last_name=lname.strip(),
                                username=username,
                                phone=phone,
                                gender=gender,
                                email=email,
                                avatar=image,
                                is_admin=is_admins,
                                is_state=is_state,
                                is_superuser=is_supers,
                                is_active=False if is_state or is_admins else True,
                                federal_state=federal_state,
                            )
                            User.set_password("123")
                            User.save()

                            username = request.user.username
                            names = (
                                request.user.first_name + " " + request.user.last_name
                            )
                            avatar = str(request.user.avatar)
                            module = "Users Module / users Table"
                            action = (
                                f"Created new {Type.lower()} name of "
                                + fname
                                + " "
                                + lname
                            )
                            path = request.path
                            sendTrials(
                                request, username, names, avatar, action, module, path
                            )
                            message = {
                                "isError": False,
                                "Message": fname + " has been successfully added",
                            }
                            return JsonResponse(
                                {
                                    "isError": False,
                                    "Message": "User has being created succefully",
                                }
                            )

                        except Exception as error:
                            username = request.user.username
                            name = (
                                request.user.first_name + " " + request.user.last_name
                            )
                            message = sendException(request, username, name, error)
                            return JsonResponse(
                                {
                                    "isError": True,
                                    "Message": "On Error Occurs . Please try again or contact system administrator",
                                }
                            )

                    elif Type == "Superuser" and request.user.is_superuser:
                        try:
                            username = models.generateUsername()
                            User = models.Users(
                                first_name=fname.strip(),
                                last_name=lname.strip(),
                                username=username,
                                phone=phone,
                                gender=gender,
                                email=email,
                                avatar=image,
                                is_admin=is_admins,
                                is_state=is_state,
                                is_superuser=is_supers,
                                is_active=False if is_state or is_admins else True,
                            )
                            User.set_password("123")
                            User.save()

                            username = request.user.username
                            names = (
                                request.user.first_name + " " + request.user.last_name
                            )
                            avatar = str(request.user.avatar)
                            module = "Users Module / users Table"
                            action = (
                                f"Created new {Type.lower()} name of "
                                + fname
                                + " "
                                + lname
                            )
                            path = request.path
                            sendTrials(
                                request, username, names, avatar, action, module, path
                            )
                            message = {
                                "isError": False,
                                "Message": fname + " has been successfully added",
                            }
                            return JsonResponse(
                                {
                                    "isError": False,
                                    "Message": "User has being created succefully",
                                }
                            )

                        except Exception as error:
                            username = request.user.username
                            name = (
                                request.user.first_name + " " + request.user.last_name
                            )
                            message = sendException(request, username, name, error)
                            return JsonResponse(
                                {
                                    "isError": True,
                                    "Message": "On Error Occurs . Please try again or contact system administrator",
                                }
                            )

                    else:
                        message = {
                            "isError": True,
                            "Message": "403-Unauthorized access.you do not have permission to access this page.",
                        }
                        return JsonResponse(message, status=200)
                else:
                    message = {
                        "isError": True,
                        "Message": "404-Unauthorized access.you do not have permission to access this page.",
                    }
                    return JsonResponse(message, status=200)
        else:
            # Get Single USERS And Check if the user has the permisison
            if request.method == "GET":
                if request.user.has_perm("Users.view_users"):
                    user = models.Users.objects.get(id=id)
                    message = {
                        "id": user.id,
                        "first_name": user.first_name,
                        "last_name": user.last_name,
                        "email": user.email,
                        "phone": user.phone,
                        "gender": user.gender,
                    }
                    return JsonResponse(
                        {"isError": False, "Message": message}, status=200
                    )

                else:
                    message = {
                        "isError": True,
                        "Message": "403-Unauthorized access.you do not have permission to access this page.",
                    }
                    return JsonResponse(message, status=200)

            # Update USERS And Check if the user has the permisison
            if request.method == "POST":
                if request.user.has_perm("Users.change_users"):
                    fname = request.POST.get("fname").strip()
                    lname = request.POST.get("lname").strip()
                    phone = request.POST.get("phone")
                    email = request.POST.get("email").lower()
                    gender = request.POST.get("gender")
                    User = models.Users.objects.get(id=id)

                    if (
                        models.Users.objects.filter(phone=phone).exists()
                        and phone.casefold() != User.phone.casefold()
                    ):
                        return JsonResponse(
                            {
                                "isError": True,
                                "Message": "This phone number ("
                                + phone
                                + ") already exists",
                            }
                        )

                    if (
                        models.Users.objects.filter(email=email).exists()
                        and email.casefold() != User.email.casefold()
                    ):
                        return JsonResponse(
                            {
                                "isError": True,
                                "Message": "This email (" + email + ") already exists",
                            }
                        )

                    User.first_name = fname
                    User.last_name = lname
                    User.email = email
                    User.phone = phone
                    User.gender = gender
                    User.save()

                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users Module / Department Table"
                    action = "Edited user"
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)
                    return JsonResponse(
                        {
                            "isError": False,
                            "Message": "User has been successfully updated",
                        },
                        status=200,
                    )

                else:
                    message = {
                        "isError": True,
                        "Message": "403-Unauthorized access.you do not have permission to access this page.",
                    }
                    return JsonResponse(message, status=200)
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + " " + request.user.last_name
        sendException(request, username, name, error)
        message = {
            "isError": True,
            "Message": "On Error Occurs . Please try again or contact system administrator",
        }
        return JsonResponse(message, status=200)


# User Roles Report
@login_required(login_url="Login")
def ViewUserRolesReportPage(request):
    if request.user.has_perm("Users.role_report"):
        context = {"pageTitle": "User Roles Report"}
        return render(request, "Roles/user_role_report.html", context)
    else:
        return render(request, "Base/403.html")


# Serach Roles


@login_required(login_url="Login")
def SearchRole(request):
    if (
        request.user.has_perm("auth.add_permission")
        and request.user.has_perm("auth.view_permission")
        or request.user.has_perm("Users.manage_role_groups")
    ):
        CheckSearch = "Search" in request.GET

        context = {"Message": "", "Search": "", "pageTitle": "Search Role"}

        if CheckSearch:
            Search = request.GET["Search"]
            context["Search"] = Search

            # Check if the role exists
            check_permisison = Permission.objects.filter(codename=Search)

            if len(check_permisison) == 0:
                context["Message"] = "This role does not exist"
            else:
                check_permisison = check_permisison[0]
                context["App"] = check_permisison.content_type.app_label
                context["Model"] = check_permisison.content_type.model
                context["Message"] = "Yes"

        return render(request, "Roles/search_role.html", context)
    else:
        return render(request, "Base/403.html")


# Roles Report
@login_required(login_url="Login")
def ViewRolesReportPage(request):
    if request.user.has_perm("Users.role_report"):
        context = {"pageTitle": "Roles Report"}
        return render(request, "Roles/role_report.html", context)
    else:
        return render(request, "Base/403.html")


# Assign Role


@login_required(login_url="Login")
def ViewRolesPage(request):
    if request.user.has_perm("auth.view_permission") and request.user.has_perm(
        "auth.add_permission"
    ):
        context = {"pageTitle": "Assign Role To User"}
        return render(request, "Roles/assign_role.html", context)
    else:
        return render(request, "Base/403.html")


# Edit Group Roles
@login_required(login_url="Login")
def ViewEditGroupPage(request, group_id):
    if request.user.has_perm("auth.view_group"):
        context = {"pageTitle": "Edit Group Roles", "GroupID": group_id}
        return render(request, "Roles/edit_group.html", context)
    else:
        return render(request, "Base/403.html")


# List of groups


@login_required(login_url="Login")
def ViewGroupRolesPage(request):
    if request.user.has_perm("Users.assign_user_to_group"):
        context = {"pageTitle": "Assign User To A Group Role"}
        return render(request, "Roles/assign_group.html", context)
    else:
        return render(request, "Base/403.html")


@login_required(login_url="Login")
def ViewManageGroupPage(request):
    if request.user.has_perm("auth.view_group"):
        context = {"pageTitle": "Create Groups"}
        return render(request, "Roles/manage_group.html", context)
    else:
        return render(request, "Base/403.html")


@login_required(login_url="Login")
def ManagePermission(request, id):
    allowed_users = ["AD", "AG", "EM"]
    if id == "0":
        if request.method == "POST":
            if request.user.has_perm("auth.add_permission"):
                Type = request.POST.get("type")
                User = request.POST.get("user")
                PermID = int(request.POST.get("permID"))

                if User[:2] in allowed_users:
                    try:
                        if User[:2] in allowed_users:
                            User = models.Users.objects.get(username=User)
                        else:
                            User = models.Users.objects.get(id=int(User))

                        # Get Permisison
                        P = Permission.objects.get(id=PermID)

                        if Type == "Add":
                            User.user_permissions.add(P)
                        else:
                            User.user_permissions.remove(P)

                        username = request.user.username
                        names = request.user.first_name + " " + request.user.last_name
                        avatar = str(request.user.avatar)
                        module = "Users-Permission Module"
                        if Type == "Add":
                            action = (
                                "Granted Permission to"
                                + "_"
                                + P.codename
                                + " With username of "
                                + User.username
                            )
                        else:
                            action = (
                                "Permission Denied to"
                                + "_"
                                + P.codename
                                + " With username of "
                                + User.username
                            )
                        path = request.path
                        sendTrials(
                            request, username, names, avatar, action, module, path
                        )

                        isError = False
                        message = (
                            "Permission Granted"
                            if Type == "Add"
                            else "Permission Denied"
                        )
                    except Exception as error:
                        username = request.user.username
                        name = request.user.first_name + " " + request.user.last_name
                        sendException(request, username, name, error)
                        message = {
                            "isError": True,
                            "Message": "On Error Occurs . Please try again or contact system administrator",
                        }
                        return JsonResponse(message, status=200)
                else:
                    isError = True
                    message = "Invalid user or this user specified not allowed for taking permissions"
                return JsonResponse(
                    {"isError": isError, "Message": message}, status=200
                )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)
    else:
        if request.method == "GET":
            if request.user.has_perm("auth.view_permission"):
                if id[:2] in allowed_users:
                    if id[:2] in allowed_users:
                        User = models.Users.objects.filter(username=id)
                    else:
                        User = models.Users.objects.filter(id=int(id))

                    perms = Permission.objects.all().order_by("content_type")

                    if len(User) > 0:
                        if len(perms) < 0:
                            return JsonResponse(
                                {
                                    "isError": True,
                                    "Message": "No Permissions Available",
                                },
                                status=200,
                            )
                        else:
                            id = 0
                            message = []
                            for xPerm in range(0, len(perms)):
                                # Checking if the user has prmisison
                                txt = (
                                    perms[xPerm].content_type.app_label
                                    + "."
                                    + perms[xPerm].codename
                                )
                                isPermitted = User[0].has_perm(txt)

                                if id != perms[xPerm].content_type.id:
                                    id = perms[xPerm].content_type.id

                                    message.append(
                                        {
                                            "App": perms[xPerm].content_type.app_label,
                                            "Model": perms[xPerm].content_type.model,
                                            "Actions": [
                                                {
                                                    "Action": perms[xPerm].codename,
                                                    "ID": perms[xPerm].id,
                                                    "isPermitted": isPermitted,
                                                    "isSuperuser": User[0].is_superuser,
                                                }
                                            ],
                                        }
                                    )
                                else:
                                    message[len(message) - 1]["Actions"].append(
                                        {
                                            "Action": perms[xPerm].codename,
                                            "ID": perms[xPerm].id,
                                            "isPermitted": isPermitted,
                                            "isSuperuser": User[0].is_superuser,
                                        }
                                    )

                            return JsonResponse(
                                {"isError": False, "Message": message}, status=200
                            )
                    else:
                        return JsonResponse(
                            {"isError": True, "Message": "User does not exist"},
                            status=200,
                        )
                else:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Invalid user or this user specified not allowed for taking permissions",
                        },
                        status=200,
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)


@login_required(login_url="Login")
def ManageGroupPermission(request, id, _id):
    allowed_users = ["AD", "AG", "EM"]
    if id == "0":
        if request.method == "POST":
            if request.user.has_perm("Users.assign_user_to_group"):
                Type = request.POST.get("type")
                User = request.POST.get("user")
                PermID = int(request.POST.get("permID"))
                if User[:2] in allowed_users:
                    try:
                        if User[:2] in allowed_users:
                            User = models.Users.objects.get(username=User)
                        else:
                            User = models.Users.objects.get(id=int(User))
                        # Get Group
                        P = Group.objects.get(id=PermID)

                        if Type == "Add":
                            User.groups.add(P)
                        else:
                            User.groups.remove(P)
                        username = request.user.username
                        names = request.user.first_name + " " + request.user.last_name
                        avatar = str(request.user.avatar)
                        module = "Users-Permission Module"
                        if Type == "Add":
                            action = (
                                "User with username of:"
                                + "_"
                                + User.username
                                + " added group of "
                                + P.name
                            )
                        else:
                            action = (
                                "User with username of:"
                                + "_"
                                + User.username
                                + " removed group of "
                                + P.name
                            )
                        path = request.path
                        sendTrials(
                            request, username, names, avatar, action, module, path
                        )

                        isError = False
                        message = (
                            "User has been added to the group "
                            if Type == "Add"
                            else "User has been removed from the group "
                        )
                    except Exception as error:
                        username = request.user.username
                        name = request.user.first_name + " " + request.user.last_name
                        sendException(request, username, name, error)
                        message = {
                            "isError": True,
                            "Message": "On Error Occurs . Please try again or contact system administrator",
                        }
                        return JsonResponse(message, status=200)
                else:
                    isError = True
                    message = "Invalid user or this user specified not allowed for taking permissions"
                return JsonResponse(
                    {"isError": isError, "Message": message}, status=200
                )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)
    else:
        if request.method == "GET":
            if request.user.has_perm("auth.view_permission") or request.user.has_perm(
                "Users.assign_user_to_group"
            ):
                if id[:2] in allowed_users:
                    if id[:2] in allowed_users:
                        User = models.Users.objects.filter(username=id)
                    else:
                        User = models.Users.objects.filter(id=int(id))

                    groups = Group.objects.all()

                    if len(User) > 0:
                        if len(groups) < 0:
                            return JsonResponse(
                                {"isError": True, "Message": "No Groups Available"},
                                status=200,
                            )
                        else:
                            id = 0
                            message = []
                            for xGroup in range(0, len(groups)):
                                message.append(
                                    {
                                        "ID": groups[xGroup].id,
                                        "Count": groups[xGroup]
                                        .permissions.all()
                                        .count(),
                                        "Name": groups[xGroup].name,
                                        "IsJoined": True
                                        if len(
                                            User[0].groups.filter(
                                                name=groups[xGroup].name
                                            )
                                        )
                                        > 0
                                        else False,
                                        "IsSuper": True
                                        if User[0].is_superuser > 0
                                        else False,
                                    }
                                )
                            return JsonResponse(
                                {"isError": False, "Message": message}, status=200
                            )
                    else:
                        return JsonResponse(
                            {"isError": True, "Message": "User does not exist"},
                            status=200,
                        )
                else:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Invalid user or this user specified not allowed for taking permissions",
                        },
                        status=200,
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "POST":
            if request.user.has_perm("auth.view_group") or request.user.has_perm(
                "Users.assign_user_to_group"
            ):
                GroupID = int(id)

                try:
                    # Get Group
                    group = Group.objects.get(id=GroupID)
                    perms = group.permissions.filter(group=group)
                    message = []
                    isError = False
                    for xPerm in range(0, len(perms)):
                        message.append(
                            {
                                "Name": perms[xPerm].name,
                                "Codename": perms[xPerm].codename,
                                "ID": perms[xPerm].id,
                                "GroupID": group.id,
                                "App": perms[xPerm].content_type.app_label,
                                "Model": perms[xPerm].content_type.model,
                            }
                        )

                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
                return JsonResponse(
                    {"isError": isError, "Message": message}, status=200
                )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "DELETE":
            if request.user.has_perm("auth.delete_permission") or request.user.has_perm(
                "Users.remove_role_from_group"
            ):
                GroupID = int(id)
                PermID = int(_id)

                try:
                    # Get Group
                    group = Group.objects.get(id=GroupID)
                    permission = Permission.objects.get(id=PermID)
                    # User = models.Users.objects.get(id=GroupID)
                    # Remove From The Group
                    perms = group.permissions.remove(permission)
                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users-Permission Module"
                    action = (
                        "User with username of:"
                        + "_"
                        + username
                        + "removed "
                        + permission.codename
                        + " from the group "
                        + group.name
                    )
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)
                    message = "Permission removed from the group"
                    isError = False

                    return JsonResponse(
                        {"isError": isError, "Message": message}, status=200
                    )

                except RestrictedError:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Cannot delete some instances of model because they are referenced through restricted foreign keys",
                        },
                        status=200,
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)


@login_required(login_url="Login")
def PermissonReport(request):
    if request.method == "POST":
        if request.user.has_perm("Users.role_report"):
            Type = request.POST.get("type")
            message = ""
            Apps = []
            Modal = []
            Codes = []

            if Type == "GetGroups":
                list = []
                groups = Group.objects.all()
                for xgroup in range(0, len(groups)):
                    list.append(
                        {
                            "GroupName": groups[xgroup].name,
                            "GroupID": groups[xgroup].id,
                        }
                    )
                message = {"isError": False, "Message": list}

            elif Type == "GetApps":
                list = []
                contentType = ContentType.objects.all()
                for xApp in range(0, len(contentType)):
                    is_added = contentType[xApp].app_label in Apps
                    if is_added == False:
                        Apps.append(contentType[xApp].app_label)
                        list.append(
                            {
                                "AppName": contentType[xApp].app_label,
                            }
                        )
                message = {"isError": False, "Message": list}

            elif Type == "GetModals":
                App = request.POST.get("app")
                list = []
                contentType = ContentType.objects.filter(app_label=App)
                for xModal in range(0, len(contentType)):
                    is_added = contentType[xModal].model in Modal
                    if is_added == False:
                        Modal.append(contentType[xModal].model)
                        list.append(
                            {
                                "ModalName": contentType[xModal].model,
                            }
                        )
                message = {"isError": False, "Message": list}

            elif Type == "GetCodes":
                try:
                    App = request.POST.get("app")
                    Modal = request.POST.get("modal")
                    list = []
                    contentType = ContentType.objects.get(app_label=App, model=Modal)
                    perms = Permission.objects.filter(content_type=contentType.id)
                    for xCode in range(0, len(perms)):
                        list.append(
                            {
                                "CodeName": perms[xCode].codename,
                                "ContentID": perms[xCode].content_type.id,
                                "PermID": perms[xCode].id,
                            }
                        )
                    message = {"isError": False, "Message": list}
                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
            elif Type == "GetReport":
                report = request.POST.get("report")
                app = request.POST.get("app")
                modal = request.POST.get("modal")
                code = request.POST.get("code")
                group = request.POST.get("group")

                try:
                    list = []

                    if report == "Role":
                        perm = Permission.objects.get(codename=code)
                        users = models.Users.objects.filter(
                            Q(groups__permissions=perm) | Q(user_permissions=perm)
                        ).distinct()

                        for xUser in range(0, len(users)):
                            avatar = users[xUser].avatar
                            list.append(
                                {
                                    "Username": users[xUser].username,
                                    "Name": users[xUser].first_name
                                    + " "
                                    + users[xUser].last_name,
                                    "Email": users[xUser].email,
                                    "Avatar": str(avatar),
                                }
                            )
                        message = {"isError": False, "Message": list}

                    elif report == "Group":
                        perm = Group.objects.get(name=group)
                        users = perm.user_set.all()

                        for xUser in range(0, len(users)):
                            avatar = users[xUser].avatar
                            list.append(
                                {
                                    "Username": users[xUser].username,
                                    "Name": users[xUser].first_name
                                    + " "
                                    + users[xUser].last_name,
                                    "Email": users[xUser].email,
                                    "Avatar": str(avatar),
                                }
                            )
                        message = {"isError": False, "Message": list}

                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)

            elif Type == "GetUserReport":
                try:
                    report = request.POST.get("report")
                    user = request.POST.get("user")
                    userInstance = models.Users.objects.get(id=int(user))

                    list = []
                    if report == "Role":
                        user_perms = Permission.objects.filter(
                            Q(user=userInstance) | Q(group__user=userInstance)
                        )

                        for xPerm in range(0, len(user_perms)):
                            list.append(
                                {
                                    "App": user_perms[xPerm].content_type.app_label,
                                    "Model": user_perms[xPerm].content_type.model,
                                    "Codename": user_perms[xPerm].codename,
                                }
                            )

                        message = {"isError": False, "Message": list}

                    elif report == "Group":
                        groups = Group.objects.filter(user=userInstance)

                        for xGroup in range(0, len(groups)):
                            list.append(
                                {
                                    "GroupID": groups[xGroup].id,
                                    "GroupName": groups[xGroup].name,
                                    "Permissions": groups[xGroup]
                                    .permissions.all()
                                    .count(),
                                }
                            )

                        message = {"isError": False, "Message": list}

                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)

            return JsonResponse(message, status=200)

        else:
            message = {
                "isError": True,
                "Message": "403-Unauthorized access.you do not have permission to access this page.",
            }
            return JsonResponse(message, status=200)


@login_required(login_url="Login")
def ManageGroup(request, id):
    if id == "0":
        if request.method == "POST":
            if request.user.has_perm("auth.add_group"):
                Name = request.POST.get("name")

                if Group.objects.filter(name=Name).exists():
                    return JsonResponse(
                        {"isError": True, "Message": "This Group already exists"}
                    )
                else:
                    g = Group(name=Name)
                    g.save()
                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users-Permission Module"
                    action = "Added new Group with Name of:" + "_" + Name
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)

                    return JsonResponse(
                        {"isError": False, "Message": "New group has been created"}
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "GET":
            if request.user.has_perm("auth.view_group"):
                groups = Group.objects.all()
                if len(groups) < 0:
                    return JsonResponse(
                        {"isError": True, "Message": "No Groups Available"}, status=200
                    )
                else:
                    id = 0
                    message = []
                    for xGroup in range(0, len(groups)):
                        message.append(
                            {
                                "ID": groups[xGroup].id,
                                "Count": groups[xGroup].permissions.all().count(),
                                "Name": groups[xGroup].name,
                            }
                        )
                    return JsonResponse(
                        {"isError": False, "Message": message}, status=200
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)
    else:
        if request.method == "GET":
            if request.user.has_perm("auth.view_group"):
                try:
                    group = Group.objects.get(id=id)

                    unauthorized_perms = [
                        "employee_directorate_approve",
                        "employee_assistant_approve",
                        "job_detail_directorate_approve",
                        "job_detail_assistant_approve",
                        "employee_exit_directorate_approve",
                        "employee_exit_assistant_approve",
                        "employee_death_directorate_approve",
                        "employee_death_assistant_approve",
                        "employee_leave_directorate_approve",
                        "employee_leave_assistant_approve",
                        "card_directorate_approve",
                        "card_assistant_approve",
                        "directorate_approve_disciplinary",
                        "card_assistant_approve",
                        "employee_add_user",
                        "approve_employee_user",
                        "logistic_directorate_approve",
                        "logistic_assistant_approve",
                    ]
                    perms = Permission.objects.filter(
                        ~Q(codename__in=unauthorized_perms),
                    ).order_by("content_type")
                    id = 0
                    message = []
                    for xPerm in range(0, len(perms)):
                        isGiven = (
                            True
                            if len(group.permissions.filter(id=perms[xPerm].id)) > 0
                            else False
                        )
                        if id != perms[xPerm].content_type.id:
                            id = perms[xPerm].content_type.id

                            message.append(
                                {
                                    "App": perms[xPerm].content_type.app_label,
                                    "Model": perms[xPerm].content_type.model,
                                    "Actions": [
                                        {
                                            "Action": perms[xPerm].codename,
                                            "ID": perms[xPerm].id,
                                            "isGiven": isGiven,
                                        }
                                    ],
                                }
                            )
                        else:
                            message[len(message) - 1]["Actions"].append(
                                {
                                    "Action": perms[xPerm].codename,
                                    "ID": perms[xPerm].id,
                                    "isGiven": isGiven,
                                }
                            )

                    isError = False

                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
                return JsonResponse(
                    {"isError": isError, "Message": message}, status=200
                )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "POST":
            if request.user.has_perm("Users.manage_role_groups"):
                GroupID = int(id)
                PermID = int(request.POST.get("permID"))
                Type = request.POST.get("type")
                try:
                    # Get Group
                    group = Group.objects.get(id=GroupID)
                    # User = models.Users.objects.get(id=GroupID)
                    permission = Permission.objects.get(id=PermID)
                    # Add To The Group
                    if Type == "Add":
                        perms = group.permissions.add(permission)
                    else:
                        perms = group.permissions.remove(permission)
                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users-Permission Module"
                    if Type == "Remove":
                        action = (
                            permission.codename
                            + " removed from the group of "
                            + group.name
                        )
                    else:
                        action = (
                            permission.codename + " Added to the group of " + group.name
                        )
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)

                    message = (
                        "Permission removed from the group"
                        if Type == "Remove"
                        else "Permission added to the group"
                    )
                    isError = False

                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
                return JsonResponse(
                    {"isError": isError, "Message": message}, status=200
                )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "DELETE":
            if request.user.has_perm("auth.delete_group"):
                try:
                    GroupID = int(id)
                    group = Group.objects.get(id=GroupID)
                    group.delete()
                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users-Permission Module"
                    action = "Deleted Group with Name of:" + "_" + group.name
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)

                    return JsonResponse(
                        {
                            "isError": False,
                            "Message": "Group has been deleted successfully",
                        },
                        status=200,
                    )
                except RestrictedError:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Cannot delete some instances of model because they are referenced through restricted foreign keys",
                        },
                        status=200,
                    )
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

        if request.method == "PATCH":
            if request.user.has_perm("auth.view_group"):
                GroupID = int(id)
                group = Group.objects.get(id=GroupID)
                message = {
                    "id": group.id,
                    "Name": group.name,
                }
                return JsonResponse({"isError": False, "Message": message}, status=200)
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)


@login_required(login_url="Login")
def RenameGroup(request):
    if request.method == "POST":
        if request.user.has_perm("auth.change_group"):
            Name = request.POST.get("name")
            ID = request.POST.get("ID")

            try:
                G = Group.objects.get(id=ID)
                if Group.objects.filter(name=Name).exists() and Name != G.name:
                    return JsonResponse(
                        {"isError": True, "Message": "This Group already exists"}
                    )
                else:
                    G.name = Name
                    G.save()
                    username = request.user.username
                    names = request.user.first_name + " " + request.user.last_name
                    avatar = str(request.user.avatar)
                    module = "Users-Permission Module"
                    action = "Updated Group with Name of:" + "_" + Name
                    path = request.path
                    sendTrials(request, username, names, avatar, action, module, path)

                    return JsonResponse(
                        {"isError": False, "Message": "Group has been renamed"}
                    )
            except Exception as error:
                username = request.user.username
                name = request.user.first_name + " " + request.user.last_name
                sendException(request, username, name, error)
                message = {
                    "isError": True,
                    "Message": "On Error Occurs . Please try again or contact system administrator",
                }
                return JsonResponse(message, status=200)
        else:
            message = {
                "isError": True,
                "Message": "403-Unauthorized access.you do not have permission to access this page.",
            }
            return JsonResponse(message, status=200)


# Search Query
@login_required(login_url="Login")
def SearchEngine(request, search):
    if request.method == "GET":
        searchQuery = models.Users.objects.filter(
            Q(username__icontains=search)
            | Q(first_name__icontains=search)
            | Q(last_name__icontains=search)
            | Q(email__icontains=search)
            | Q(phone__icontains=search),
            is_active=True,
        )

        message = []
        for xSearch in range(0, len(searchQuery)):
            if searchQuery[xSearch].is_superuser:
                userType = "Superuser"
            elif searchQuery[xSearch].is_admin:
                userType = "Admin"
            elif searchQuery[xSearch].is_state:
                userType = "State"
            else:
                userType = "Anonymous"
            message.append(
                {
                    "label": f"{searchQuery[xSearch].username} - {searchQuery[xSearch].first_name} {searchQuery[xSearch].last_name} ({searchQuery[xSearch].email} - {searchQuery[xSearch].phone})",
                    "value": f"{searchQuery[xSearch].username} - {searchQuery[xSearch].first_name} {searchQuery[xSearch].last_name}",
                    "username": searchQuery[xSearch].username,
                    "userid": searchQuery[xSearch].id,
                },
            )
        return JsonResponse({"Message": message}, status=200)


# Audit and logs


@login_required(login_url="Login")
def AuditTrials(request):
    if request.user.has_perm("Users.view_audittrials"):
        # Checking if these values been sent throught GET Request Method
        CheckSearchQuery = "SearchQuery" in request.GET
        CheckDataNumber = "DataNumber" in request.GET
        DataNumber = 5
        SearchQuery = ""
        Audits = ""

        if CheckDataNumber:
            DataNumber = int(request.GET["DataNumber"])

        if CheckSearchQuery:
            SearchQuery = request.GET["SearchQuery"]
            Audits = models.AuditTrials.objects.filter(
                Q(Username__icontains=SearchQuery)
                | Q(Name__icontains=SearchQuery)
                | Q(Module__icontains=SearchQuery)
                | Q(Actions__icontains=SearchQuery)
                | Q(date_of_action__icontains=SearchQuery)
                | Q(user_agent__icontains=SearchQuery)
            ).order_by("-date_of_action")
        else:
            Audits = models.AuditTrials.objects.all().order_by("-date_of_action")

        paginator = Paginator(Audits, DataNumber)

        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)

        Pages = list(
            paginator.get_elided_page_range(page_obj.number, on_each_side=0, on_ends=1)
        )

        context = {
            "page_obj": page_obj,
            "SearchQuery": SearchQuery,
            "DataNumber": DataNumber,
            "TotalUsers": len(Audits),
            "Pages": Pages,
            "pageTitle": "Audit Trials",
        }
        return render(request, "Logs/audit_trial.html", context)
    else:
        return render(request, "Base/403.html")


@login_required(login_url="Login")
def ErrorLogs(request):
    if request.user.has_perm("Users.view_errorlogs"):
        # Checking if these values been sent throught GET Request Method
        CheckSearchQuery = "SearchQuery" in request.GET
        CheckDataNumber = "DataNumber" in request.GET
        DataNumber = 5
        SearchQuery = ""
        Errors = ""

        if CheckDataNumber:
            DataNumber = int(request.GET["DataNumber"])

        if CheckSearchQuery:
            SearchQuery = request.GET["SearchQuery"]
            Errors = models.ErrorLogs.objects.filter(
                Q(Username__icontains=SearchQuery)
                | Q(Name__icontains=SearchQuery)
                | Q(Expected_error__icontains=SearchQuery)
                | Q(field_error__icontains=SearchQuery)
                | Q(line_number__icontains=SearchQuery)
                | Q(date_recorded__icontains=SearchQuery)
                | Q(user_agent__icontains=SearchQuery)
            ).order_by("-date_recorded")
        else:
            Errors = models.ErrorLogs.objects.all().order_by("-date_recorded")

        paginator = Paginator(Errors, DataNumber)

        page_number = request.GET.get("page")
        page_obj = paginator.get_page(page_number)

        Pages = list(
            paginator.get_elided_page_range(page_obj.number, on_each_side=1, on_ends=1)
        )

        context = {
            "page_obj": page_obj,
            "SearchQuery": SearchQuery,
            "DataNumber": DataNumber,
            "TotalUsers": len(Errors),
            "Pages": Pages,
            "pageTitle": "Error Logs",
        }
        return render(request, "Logs/errors_logs.html", context)
    else:
        return render(request, "Base/403.html")


@login_required(login_url="Login")
def ManageErrorLogs(request, action):
    if action == "AuditTrial":
        if request.method == "POST":
            if request.user.has_perm("Users.view_audittrials"):
                try:
                    id = request.POST.get("id")
                    trial = models.AuditTrials.objects.get(id=id)

                    message = {
                        "ID": trial.id,
                        "Trial": trial.Actions,
                        "Path": trial.path,
                    }

                    return JsonResponse(
                        {"isError": False, "Message": message}, status=200
                    )
                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)

    if action == "ErrorLogs":
        if request.method == "POST":
            if request.user.has_perm("Users.view_errorlogs"):
                try:
                    id = request.POST.get("id")
                    logs = models.ErrorLogs.objects.get(id=id)

                    message = {"ID": logs.id, "TraceBack": logs.trace_back}

                    return JsonResponse(
                        {"isError": False, "Message": message}, status=200
                    )
                except Exception as error:
                    username = request.user.username
                    name = request.user.first_name + " " + request.user.last_name
                    sendException(request, username, name, error)
                    message = {
                        "isError": True,
                        "Message": "On Error Occurs . Please try again or contact system administrator",
                    }
                    return JsonResponse(message, status=200)
            else:
                message = {
                    "isError": True,
                    "Message": "403-Unauthorized access.you do not have permission to access this page.",
                }
                return JsonResponse(message, status=200)


@login_required(login_url="Login")
def find_user(request, id):
    # TODO: Check Permission
    if request.method == "GET":
        if id is not None:
            # find user
            user_to_edit = models.Users.objects.filter(id=id).first()
            if user_to_edit is not None:
                return JsonResponse(
                    {
                        "fname": user_to_edit.first_name,
                        "lname": user_to_edit.last_name,
                        "email": user_to_edit.email,
                        "phone": user_to_edit.phone,
                        "state": user_to_edit.federal_state.state_id
                        if user_to_edit.federal_state
                        else None,
                        "gender": user_to_edit.gender,
                        "img": user_to_edit.avatar.url if user_to_edit.avatar else None,
                        "type": user_to_edit.is_superuser,
                    }
                )
            else:
                return JsonResponse({"isError": True, "Message": "User not found"})
        else:
            return JsonResponse({"isError": True, "Message": "Provide user ID"})
    else:
        return JsonResponse({"isError": True, "Message": "Method Not Supported"})


@login_required(login_url="Login")
def user_activation(request, action, id):
    # TODO: check permissions
    if request.method == "GET":
        if id is not None:
            # find user to deactivate or activate
            user = models.Users.objects.filter(id=id).first()
            if user is not None:
                # check an action whether is activation or deactivation
                if not user.is_superuser:
                    if action is not None:
                        if action == "activate":
                            if user.is_active:  # check if the user is already activated
                                return JsonResponse(
                                    {
                                        "isError": True,
                                        "Message": "User Already Activated",
                                    }
                                )

                            # activate user based on action
                            user.is_active = True
                            user.save()

                            # TODO: add autditory log
                            return JsonResponse(
                                {
                                    "isError": False,
                                    "Message": "User Activated Succefully",
                                }
                            )

                        elif action == "deactiavte":
                            if (
                                not user.is_active
                            ):  # check if the user already deactivated
                                return JsonResponse(
                                    {
                                        "isError": True,
                                        "Message": "User Already was Deactivated",
                                    }
                                )

                            # deactivate user based on action
                            user.is_active = False
                            user.save()

                            # TODO: add autditory log
                            return JsonResponse(
                                {
                                    "isError": False,
                                    "Message": "User Deactiavted Succefully",
                                }
                            )
                        else:
                            return JsonResponse(
                                {
                                    "isError": True,
                                    "Message": "Bad Request Action not allowed",
                                }
                            )
                    else:
                        return JsonResponse(
                            {
                                "isError": True,
                                "Message": "Bad Request Provide an action",
                            }
                        )
                else:
                    return JsonResponse(
                        {
                            "isError": True,
                            "Message": "Super User Can't be disabled nor actiavted",
                        }
                    )
            else:
                return JsonResponse({"isError": True, "Message": "User Not Found"})
        else:
            return JsonResponse(
                {"isError": True, "Message": "Bad Request Provide User ID"}
            )
    else:
        return JsonResponse({"isError": True, "Message": "Method Not Allowed"})


@login_required(login_url="Login")
def updateUser(request):
    if request.method == "POST":
        userID = request.POST.get("userID", None)
        gender = request.POST.get("gender", None)
        fname = request.POST.get("fname", None)
        lname = request.POST.get("lname", None)
        phone = request.POST.get("phone", None)
        email = request.POST.get("email", None)
        image = ""

        if "img" in request.FILES:
            image = request.FILES["img"]

        state = request.POST.get("state", None)

        if (
            userID is None
            or gender is None
            or fname is None
            or lname is None
            or phone is None
            or email is None
        ):
            return JsonResponse({"isError": True, "Message": "All Feilds are required"})

        user = models.Users.objects.filter(Q(id=userID)).first()

        if not request.user.is_superuser:
            if state is None or state == "Select State":
                return JsonResponse({"isError": True, "Message": "State is Required"})

            user_state = customer_model.federal_state.objects.filter(
                Q(state_id=state)
            ).first()

            if user_state is not None:
                # only update state for the state user and admins only
                user.federal_state = user_state

        user.email = email
        user.gender = gender
        user.first_name = fname
        user.last_name = lname
        user.phone = phone
        user.avatar = image if image else user.avatar

        user.save()

        return JsonResponse({"isError": False, "Message": "User Updaed Succefully"})

    return {"isError": True, "Message": "Not Allowed"}


# single user profile
@login_required(login_url="Login")
def User_profile(request, id):
    if not id:
        return render(request, "Base/403.html")

    get_user = models.Users.objects.filter(id=id).first()

    if not get_user:
        return render(request, "Base/403.html")

    print(get_user.avatar)
    context = {"pageTitle": "User Profile", "user": get_user}
    return render(request, "Users/user_profile.html", context)
