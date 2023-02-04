from django.http import JsonResponse
from django.shortcuts import render
from django.core.paginator import Paginator
from . import models


def AccountsPage(request):
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 10
    SearchQuery = ''
    AccountList = []

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    # Demo data
    AccountList = [
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,

        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
    ]

    paginator = Paginator(AccountList, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
        'pageTitle': 'Accounts',
        'page_obj': page_obj,
        'SearchQuery': SearchQuery,
        'DataNumber': DataNumber,
    }
    return render(request, 'Finance/account_list.html', context)


def AddAccount(request):
    context = {
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
    CheckSearchQuery = 'SearchQuery' in request.GET
    CheckDataNumber = 'DataNumber' in request.GET
    DataNumber = 10
    SearchQuery = ''
    AccountList = []

    if CheckDataNumber:
        DataNumber = int(request.GET['DataNumber'])

    if CheckSearchQuery:
        SearchQuery = request.GET['SearchQuery']
    else:
        pass

    # Demo data
    AccountList = [
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
        {
            'number': 4647238673832,
            'type': 'Gaari',
            'name': 'My account',
            'amount': 9084747,
        },
    ]

    paginator = Paginator(AccountList, DataNumber)

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    context = {
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
