from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from . import models
from . models import account, receipt_voucher
from . forms import accountform
from django.contrib import messages
from Users.views import sendException, sendTrials
from datetime import datetime
from django.db.models import Q
from django.contrib.auth.decorators import login_required
from Customers import models as customer_model
# current_date = date.today()
# currentDatetime = datetime.now()
# years_to_add = current_date.year + 4
# expired_year = current_date.replace(year=years_to_add)


def AccountsPage(request):

    accounts = account.objects.all().order_by('-created_at')
    account_type = models.account_types.objects.all()
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

    paginator = Paginator(accounts, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {'pageTitle': 'Accounts',
               'page_obj': page_obj,
               'SearchQuery': SearchQuery,
               'DataNumber': DataNumber,
               "accounts": accounts,
               'acc_types': account_type
               }

    return render(request, 'Finance/account_list.html', context)


def AddAccount(request):

    if request.method == "POST":
        acc_number = request.POST.get('account_number', None)
        acc_name = request.POST.get('account_name', None)
        acc_type = request.POST.get('account_type', None)
        acc_amount = request.POST.get('account_amount', None)

        if acc_number is None or acc_name is None or acc_type is None or acc_amount is None:
            return JsonResponse(
                {
                    'isError': True,
                    'title': 'validate error',
                    'type': 'danger',
                    'Message': 'Fill All Required Fields'
                }
            )

        new_account = models.account(
            account_number=acc_number,
            account_name=acc_name,
            account_type=acc_type,
            account_amount=acc_amount
        )
        new_account.save()
        return JsonResponse({'isError': False, 'Message': 'created successfully'})

    context = {
        'pageTitle': 'Create Account',
        'account_types': models.account_types.objects.all()
    }
    return render(request, 'Finance/add_account.html', context)


def ManageAccounts(request, action):
    # creating new account
    if action == 'AddNewAccount':
        if request.method == 'POST':
            # Get all data from the request
            account_name = request.POST.get('account_name', None)
            account_type = request.POST.get('account_type', None)
            account_number = request.POST.get('account_number', None)
            amount = request.POST.get('account_amount', None)

            if account_name is None or account_type is None or account_number is None or amount is None:
                return JsonResponse({
                    'isError': True,
                    'Message': 'Bad Request All Filds are required'
                }, status=400)

            else:
                acc_type = models.account_types.objects.filter(
                    Q(name=account_type)).first()

                new_account = models.account(
                    account_number=account_number,
                    account_name=account_name,
                    account_type=acc_type,
                    amount=amount,
                    reg_user=request.user
                )
                # Save data to database
                new_account.save()
                return JsonResponse({'isError': False, 'Message': 'created successfully'})

    # If there is not action matching
    return render(request, 'Base/403.html')
    # Return 404 error


# This will display the receipts list
def ReceiptPage(request):
    receipt_vouchers = receipt_voucher.objects.all().order_by('-created_at')
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

    paginator = Paginator(receipt_vouchers, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        "receipt_vouchers": receipt_vouchers,
        'pageTitle': 'Receipts',
        'page_obj': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,
    }
    return render(request, 'Finance/receipt_list.html', context)

# This will display the html for creating a new receipt


def AddReceipt(request):

    context = {
        'pageTitle': 'Create Receipt',
    }
    return render(request, 'Finance/add_receipt.html', context)


# search rvaccount


@login_required(login_url='Login')
def Searchrvaccount(request, id):
    if request.method == 'GET':
        searchQuery = models.receipt_voucher.finance.objects.filter(
            Q(account_number__icontains=id))
        message = []
        for xSearch in range(0, len(searchQuery)):
            message.append(
                {
                    'label': f"{searchQuery[xSearch].account_number}",
                    'value': f"{searchQuery[xSearch].account_number}",
                    'account_number': searchQuery[xSearch].account_number,
                    'account_pk': searchQuery[xSearch].account_id,

                }
            )
        return JsonResponse({'Message': message}, status=200)


# receipt vouch

@login_required(login_url='Login')
# Search Query
def SearchReceiptVoucher(request, search):
    if request.method == 'GET':
        searchQuery = models.finance.receipt_voucher.objects.filter(
            Q(rv_number__icontains=search))
        message = []
        for xSearch in range(0, len(searchQuery)):
            message.append(
                {
                    'label': f"{searchQuery[xSearch].rv_number}",
                    'value': f"{searchQuery[xSearch].rv_number}",
                    'rv_id': searchQuery[xSearch].rv_id,

                }
            )
        return JsonResponse({'Message': message}, status=200)

# search rcfrom


@login_required(login_url='Login')
def receipt(request, id):
    try:

        if id == 0:
            # Post new  Weapon model and check if the user is allowed to create
            if request.method == 'POST':
                Type = request.POST.get('Type')
                if Type == "new_reciet":
                    # owner = request.POST.get('owner')
                    federal_state = request.POST.get('federal_state')

                    rv_id = request.POST.get('rv_id')
                    is_voucher_exist = models.finance.objects.filter(
                        receipt_voucher=rv_id).exists()

                    if is_voucher_exist:
                        get_voucher = models.finance.objects.get(
                            receipt_voucher=rv_id)
                        message = {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'This receipt voucher already used by {get_voucher.owner.account_name}'
                        }
                        return JsonResponse(message, status=200)
                    else:

                        # get instance of receipt voucher
                        get_rv_number = models.finance.receipt_voucher.objects.get(
                            rv_id=rv_id)

                        # get instance of owner
                        get_owner = models.finance.objects.get(
                            customer_id=get_rv_number.rv_from.customer_id)

                        # get instance of federal state
                        get_federal_state = models.finance.federal_state.objects.get(
                            state_id=federal_state)
                        save_reciet = models.finance(
                            federal_state=get_federal_state,
                            owner=get_owner,

                            reg_user=request.user,
                            receipt_voucher=get_rv_number,

                        )
                        save_reciet.save()
                        # TODO: Add to Trial
                        message = {
                            'isError': False,
                            'title': "Successfully!!!",
                            'type': "success",
                            'Message': 'New reciet has been successfully created'
                        }

                        return JsonResponse(message, status=200)
                elif Type == "renew_license":
                    # owner = request.POST.get('owner')
                    federal_state = request.POST.get('federal_state')

                    license_type = request.POST.get('license_type')

                    rv_id = request.POST.get('rv_id')
                    is_voucher_exist = models.finance.objects.filter(
                        receipt_voucher=rv_id).exists()

                    if is_voucher_exist:
                        get_voucher = models.finance.license.objects.get(
                            receipt_voucher=rv_id)
                        message = {
                            'isError': True,
                            'title': "Duplicate Error!!",
                            'type': "warning",
                            'Message': f'This receipt voucher already used by {get_voucher.owner.full_name}'
                        }
                        return JsonResponse(message, status=200)
                    else:

                        # get instance of receipt voucher
                        get_rv_number = models.finance.receipt_voucher.objects.get(
                            rv_id=rv_id)

                        # get instance of owner
                        get_owner = models.finance.objects.get(
                            customer_id=get_rv_number.rv_from.customer_id)

                        # get instance of federal state
                        get_federal_state = models.federal_state.objects.get(
                            state_id=federal_state)
                        get_lasted_license = models.finance.objects.filter(
                            owner=get_owner.customer_id).order_by('-license_id')[0]
                        save_license = models.finance(
                            federal_state=get_federal_state,
                            owner=get_owner,

                            reg_user=request.user,
                            receipt_voucher=get_rv_number,
                            reg_no=get_lasted_license.reg_no
                        )
                        save_license.save()
                        # TODO: Add to Trial
                        message = {
                            'isError': False,
                            'title': "Successfully!!!",
                            'type': "success",
                            'Message': 'New license has been successfully created'
                        }

                        return JsonResponse(message, status=200)
                else:
                    message = {
                        'isError': True,
                        'title': "Duplicate Error!!",
                        'type': "warning",
                        'Message': f'This receipt voucher already used by {get_voucher.owner.full_name}'
                    }
                    return JsonResponse(message, status=200)
    except Exception as error:
        username = request.user.username
        name = request.user.first_name + ' ' + request.user.last_name

        message = {
            'isError': True,
            'title': "Server Error",
            'type': "error",
            'Message': 'On Error Occurs . Please try again or contact system administrator'
        }
        return JsonResponse(message, status=200)


@login_required(login_url='Login')
def find_account(request, id):
    if request.method == 'GET':
        # if name is not None:
        rv_account = models.account.objects.filter(
            Q(account_name__icontains=id))
        message = []
        if rv_account is not None:
            for xSearch in range(0, len(rv_account)):
                message.append(
                    {
                        'label': f"{rv_account[xSearch].account_name}",
                        'value': f"{rv_account[xSearch].account_name}",
                        'amount': rv_account[xSearch].amount,
                    }
                )
            return JsonResponse({'Message': message}, status=200)
        return JsonResponse({'isError': True, 'Message': 'Not found'})


@login_required(login_url='Login')
def find_rcfrom(request, name):
    if request.method == 'GET':
        # if name is not None:
        rc_from = models.customer_model.customer.objects.filter(
            Q(full_name__icontains=name))
        message = []
        if rc_from is not None:
            for xSearch in range(0, len(rc_from)):
                message.append(
                    {
                        'label': f"{ rc_from[xSearch].full_name}",
                        'value': f"{ rc_from[xSearch].full_name}",
                        'per_id': f"{ rc_from[xSearch].personal_id}",
                        'mot_name': f"{ rc_from[xSearch].mother_name}",

                    }
                )

            return JsonResponse({'Message': message}, status=200)
        return JsonResponse({'isError': True, 'Message': 'Not found'})


@login_required(login_url='Login')
def savereciept(request, action):
    # creating new account
    if action == 'reciet_form':
        if request.method == 'POST':
            # Get all data from the request
            amount = request.POST.get('rvamount')
            rv_number = request.POST.get('rv_number')
            personal_id = request.POST.get('personal_id')
            reason = request.POST.get('reason')

            customer = customer_model.customer.objects.filter(
                Q(personal_id=personal_id)).first()

            new_reciet = models.receipt_voucher(
                rv_number=rv_number,
                rv_from=customer,
                rv_amount=amount,
                reason=reason,
                reg_user=request.user
            )
            # Save data to database
            new_reciet.save()
            return JsonResponse({'isError': False, 'Message': 'created successfully'})

    # If there is not action matching
    return render(request, 'receipt_list.html')


# updated accout
@login_required(login_url="Login")
def findupdatedaccount(request, name):
    if id is not None:
        found_account = account.objects.filter(account_id=name).first()
        if found_account is not None:
            return JsonResponse({
                'isError': False,
                'account_number': found_account.account_number,
                'account_type': {
                    'id': found_account.account_type.type_id
                },
                'account_name': found_account.account_name,
                'amount': found_account.amount
            })
        return JsonResponse({
            'isError': True,
            'Message': 'Account Not Found'
        })


@login_required(login_url="Login")
def find_reciept(request, id):
    if id is not None:
        found_receipt = receipt_voucher.objects.filter(rv_id=id).first()
        if found_receipt is not None:
            return JsonResponse({
                'isError': False,
                'rv_number': found_receipt.rv_number,
                'rv_from': f"{found_receipt.rv_from.full_name} - {found_receipt.rv_from.personal_id}",
                'rv_amount': found_receipt.rv_amount,
                'reason': found_receipt.reason
            })
        return JsonResponse({
            'isError': True,
            'Message': 'receipt Not Found'
        })

    return JsonResponse({
        'isError': True,
        'Message': 'Provide an ID'
    })


# update reciept
@login_required(login_url="Login")
def update_reviept(request, id):
    try:
        rvnumber = request.POST.get('rvnumber', None)
        # rcfrom = request.POST.get('rcfrom', None)
        reason = request.POST.get('reason', None)
        amaount = request.POST.get('amount', None)

        if id is not None:
            rv = models.receipt_voucher.objects.filter(
                rv_id=id).first()

            if rv is not None:
                if rvnumber is None or reason is None or amaount is None:
                    return JsonResponse({'isErro': False, 'Message': 'all fields are required'}, status=400)

                rv.rv_number = rvnumber
                rv.reason = reason
                rv.rv_amount = amaount

                rv.save()

                # for auditory
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "finance / update"
                action = f"updated a reciept {rv.rv_id}"
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                return JsonResponse({'isError': False, 'Message': 'reciept has been updated'}, status=200)
            return JsonResponse({'isErro': False, 'Message': 'reciept feild is required'}, status=400)

    except Exception as error:
        username = request.user.username
        name = request.user.first_name + '' + request.user.last_name
        sendException(
            request, username, name, error
        )
        message = {
            'isError': True,
            'Message': 'on Error occurs . please try again or contact system adminstrator'

        }
        return JsonResponse(message, status=200)


# update an account


@ login_required(login_url="Login")
def update_account(request):
    try:
        account_id = request.POST.get('account_id', None)
        accnumber = request.POST.get('accnumber', None)
        accountype = request.POST.get('acctype', None)
        accname = request.POST.get('accname', None)
        amount = request.POST.get('accamount', None)

        if account_id is not None:
            account = models.account.objects.filter(
                account_id=account_id).first()

            if account is not None:
                if accname is None or accnumber is None or accountype is None or amount is None:
                    return JsonResponse({'isErro': False, 'Message': 'all fields are required'}, status=400)

                account_type = models.account_types.objects.filter(
                    type_id=accountype).first()

                account.account_number = accnumber
                account.account_type = account_type
                account.account_name = accname
                account. amount = amount

                account.save()

                # for auditory
                username = request.user.username
                names = request.user.first_name + ' ' + request.user.last_name
                avatar = str(request.user.avatar)
                module = "Finance / update"
                action = 'updated a accont' + account.account_name
                path = request.path
                sendTrials(request, username, names,
                           avatar, action, module, path)
                return JsonResponse({'isError': False, 'Message': 'account has been updated'}, status=200)
            return JsonResponse({'isErro': False, 'Message': 'company feild is required'}, status=400)

    except Exception as error:
        username = request.user.username
        name = request.user.first_name + '' + request.user.last_name
        sendException(
            request, username, name, error
        )
        message = {
            'isError': True,
            'Message': 'on Error occurs . please try again or contact system adminstrator'

        }
        return JsonResponse(message, status=200)
