from django.http import JsonResponse
from django.shortcuts import render, redirect
from django.core.paginator import Paginator
from . import models
from . models import account, receipt_voucher
from . forms import accountform
from django.contrib import messages
from Users.views import sendException, sendTrials
from datetime import datetime


def AccountsPage(request):

    accounts = account.objects.all()

    acconuttype = []
    finance = []

    if request.method == 'POST':
        acc_number = request.POST.get('account_number', None)
        acc_name = request.POST.get('account_name', None)
        acc_type = request.POST.get('account_type', None)
        acc_amount = request.POST.get('account_amount', None)

        if acc_number is None or acc_name is None or acc_type is None or acc_amount is None:
            return JsonResponse(
                {
                    'isError': True,
                    'title': 'validate error',
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
        username = request.user.username
        names = request.user.first_name + '' + request.user.last_name
        avatar = str(request.user.avatar)
        module = "Finance / add account"
        action = f'Registered A Company {acc_name} at {datetime.now()}'
        path = request.path
        sendTrials(request, username, names, avatar, action, module, path)
        return JsonResponse({
            'isError': False, 'Message':
                'account has saved'
        }, status=200)
    context = {
        'pageTitle': 'Accounts',
        'accounttype': acconuttype,
        'finance': finance

    }

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
    form = accountform()
    if request.method == "POST":
        form = accountform(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "created a new account")
            return redirect("AccountsPage")
        else:
            messages.error(request, "error accured")

    context = {"form": form,
               'pageTitle': 'Create Account',
               'account_types': models.account_types.objects.all()
               }
    return render(request, 'Finance/add_account.html', context)


def ManageAccounts(request, action):
    # action : Holds the action to be performed

    # TODO
    # First check if the request matches your need [POST,GET. etc]
    # Then check if the user has the required permission

    # This action will create a new account
    if action == 'AddNewAccount':
        if request.method == 'POST':
            # Get all data from the request
            account_name = request.POST.get('account_name')
            account_type = request.POST.get('account_type')
            account_number = request.POST.get('account_number')
            amount = request.POST.get('amount')

            # Validaet data
            if account_name == '' or account_name == 'null' or account_name is None or account_name == 'undefined':
                return JsonResponse(
                    {
                        'isError': True,
                        'Message': 'Please enter account name',
                        'title': 'Validation Error!',
                        'type': 'warning',
                    }
                )

            if account_type == '' or account_type == 'null' or account_type is None or account_type == 'undefined':
                return JsonResponse(
                    {
                        'isError': True,
                        'Message': 'Please enter account type',
                        'title': 'Validation Error!',
                        'type': 'warning',
                    }
                )

            if account_number == '' or account_number == 'null' or account_number is None or account_number == 'undefined':
                return JsonResponse(
                    {
                        'isError': True,
                        'Message': 'Please enter account number',
                        'title': 'Validation Error!',
                        'type': 'warning',
                    }
                )

            if amount == '' or amount == 'null' or amount is None or amount == 'undefined':
                return JsonResponse(
                    {
                        'isError': True,
                        'Message': 'Please enter an amont',
                        'title': 'Validation Error!',
                        'type': 'warning',
                    }
                )

        # Save data to database

    # If there is not action matching
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
