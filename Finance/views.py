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
from Customers.autditory import save_error, save_log

# current_date = date.today()
# currentDatetime = datetime.now()
# years_to_add = current_date.year + 4
# expired_year = current_date.replace(year=years_to_add)


def AccountsPage(request):
    try:
        if request.user.has_perm('Finance.view_account'):
            accounts = account.objects.all().order_by('-created_at')
            account_type = models.account_types.objects.all()
            CheckSearchQuery = 'SearchQuery' in request.GET
            CheckStatus = 'Status' in request.GET
            Status = 'search'
            CheckDataNumber = 'DataNumber' in request.GET
            DataNumber = 10
            SearchQuery = ''

            if CheckDataNumber:
                DataNumber = int(request.GET['DataNumber'])

            if CheckDataNumber:
                DataNumber = int(request.GET['DataNumber'])

            if CheckSearchQuery:
                SearchQuery = request.GET['SearchQuery']
                accounts = account.objects.filter(
                    Q(account_name__icontains=SearchQuery)).order_by('-created_at')

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
        return redirect('un_authorized')
    except Exception as error:
        save_error(request, error)


def AddAccount(request):
    # try:
    if request.user.has_perm('Finance.add_account'):

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

            found_acct = models.account_types.objects.filter(
                Q(type_id=acc_type)).first()

            new_account = models.account(
                account_number=acc_number,
                account_name=acc_name,
                account_type=found_acct,
                amount=acc_amount,
                reg_user=request.user
            )
            new_account.save()
            return JsonResponse({'isError': False, 'Message': 'created successfully'})

        context = {
            'pageTitle': 'Create Account',
            'account_types': models.account_types.objects.all()
        }
        return render(request, 'Finance/add_account.html', context)
    return redirect('un_authorized')
    # except Exception as error:
    #     save_error(request, error)


def ManageAccounts(request, action):
    try:
        if request.user.has_perm('Customer.view_account'):

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
    except Exception as error:
        save_error(request, error)


# This will display the receipts list
def ReceiptPage(request):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):
            receipt_vouchers = receipt_voucher.objects.all().order_by('-created_at')
            CheckSearchQuery = 'SearchQuery' in request.GET
            CheckDataNumber = 'DataNumber' in request.GET
            DataNumber = 10
            SearchQuery = ''

            if CheckDataNumber:
                DataNumber = int(request.GET['DataNumber'])

            if CheckSearchQuery:
                SearchQuery = request.GET['SearchQuery']
                receipt_vouchers = receipt_voucher.objects.filter(
                    Q(rv_number__icontains=SearchQuery)).order_by('-created_at')

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
    except Exception as error:
        save_error(request, error)

# This will display the html for creating a new receipt


def AddReceipt(request):

    context = {
        'pageTitle': 'Create Receipt',
    }
    return render(request, 'Finance/add_receipt.html', context)


# search rvaccount


@login_required(login_url='Login')
def Searchrvaccount(request, id):
    try:

        if request.user.has_perm('Finance.view_account'):

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

    except Exception as error:
        save_error(request, error)
# receipt vouch


@login_required(login_url='Login')
# Search Query
def SearchReceiptVoucher(request, search):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):

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
    except Exception as error:
        save_error(request, error)

# search rcfrom


@login_required(login_url='Login')
def find_account(request, id):
    try:
        if request.user.has_perm('Finance.view_account'):

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
    except Exception as error:
        save_error(request, error)


@login_required(login_url='Login')
def find_rcfrom(request, name):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):

            if request.method == 'GET':
                # if name is not None:
                rc_from = models.customer_model.customer.objects.filter(
                    Q(full_name__icontains=name))
                message = []
                if rc_from is not None:
                    for xSearch in range(0, len(rc_from)):
                        message.append(
                            {
                                'label': f"{ rc_from[xSearch].full_name} - {rc_from[xSearch].personal_id}",
                                'value': f"{ rc_from[xSearch].full_name} - {rc_from[xSearch].personal_id}",
                                'per_id': f"{ rc_from[xSearch].personal_id}",
                                'mot_name': f"{ rc_from[xSearch].mother_name}",

                            }
                        )

                    return JsonResponse({'Message': message}, status=200)
                return JsonResponse({'isError': True, 'Message': 'Not found'})
    except Exception as error:
        save_error(request, error)

# search received from  on update  receipt payment


@login_required(login_url='Login')
def find_rcfroms(request, name):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):

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
                                'value': f"{ rc_from[xSearch].full_name}"
                            }
                        )

                    return JsonResponse({'Message': message}, status=200)
                return JsonResponse({'isError': True, 'Message': 'Not found'})
    except Exception as error:
        save_error(request, error)

    recived_from = models.customer_model.customer.objects.filter(
        Q(full_name__icontains=name))
    messages = []
    if recived_from is not None:
        for xsearch in range(0, len(recived_from)):
            messages.append({
                'label': f"{recived_from[xsearch].full_name}",
                'value': f"{recived_from[xsearch].full_name}",
                'per_id': f"{[xsearch].personal_id}",
                'rcfrom': f"{[xsearch].rv_from}",
            })


@login_required(login_url='Login')
def savereciept(request, action):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):

            # creating new account
            if action == 'reciet_form':
                if request.method == 'POST':
                    # Get all data from the request
                    amount = request.POST.get('rvamount', None)
                    rv_number = request.POST.get('rv_number', None)
                    personal_id = request.POST.get('personal_id', None)
                    reason = request.POST.get('reason', None)

                    if rv_number is None or reason is None or amount is None or amount == 0 or personal_id is None:
                        return JsonResponse({
                            'isError': True,
                            'Message': 'Bad Request All Filds are required'
                        })

                    customer = customer_model.customer.objects.filter(
                        Q(personal_id=personal_id)).first()

                    if not customer.is_verified:
                        return JsonResponse({
                            'isError': True,
                            'Message': 'customer is not verified',

                        })

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
    except Exception as error:
        save_error(request, error)

# updated accout


@login_required(login_url="Login")
def findupdatedaccount(request, name):
    try:
        if request.user.has_perm('Finance.view_account'):

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
    except Exception as error:
        save_error(request, error)


@login_required(login_url="Login")
def find_reciept(request, id):
    try:
        if request.user.has_perm('Finance.view_receipt_voucher'):

            if id is not None:
                found_receipt = receipt_voucher.objects.filter(
                    rv_id=id).first()
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
    except Exception as error:
        save_error(request, error)

# update reciept


@login_required(login_url="Login")
def update_reviept(request, id):
    try:
        if request.user.has_perm('Finance.change_receipt_voucher'):

            try:
                if request.user.has_perm('Finance.change_receipt_voucher'):

                    rcfrom = request.POST.get('recievedfrom', None)
                    reason = request.POST.get('reason', None)

                    if id is not None:
                        rv = models.receipt_voucher.objects.filter(
                            rv_id=id).first()

                        if rv is not None:
                            if rcfrom is None or reason is None:
                                return JsonResponse({'isErro': False, 'Message': 'all fields are required'}, status=400)

                            rv_from = customer_model.customer.objects.filter(
                                Q(personal_id=rcfrom)).first()

                            if rv_from is None:
                                return JsonResponse({
                                    'isError': True,
                                    'Message': 'Customer Not found'
                                })

                            rv.rv_from = rv_from
                            rv.reason = reason

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
    except Exception as error:
        save_error(request, error)


# update an account


@ login_required(login_url="Login")
def update_account(request):
    try:
        if request.user.has_perm('Finance.change_account'):

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
    except Exception as error:
        save_error(request, error)
