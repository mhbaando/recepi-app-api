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


def AccountsPage(request):

    accounts = account.objects.all()

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
               "accounts": accounts
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
            account_name = request.POST.get('account_name')
            account_type = request.POST.get('account_type')
            account_number = request.POST.get('account_number')
            amount = request.POST.get('account_amount')

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
    receipt_vouchers = receipt_voucher.objects.all()
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
