from django.shortcuts import render
from django.core.paginator import Paginator


# This will display all the accounts in the database
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

# This will display the html for creating a new account
def AddAccount(request):
    context = {
        'pageTitle': 'Create Account',
    }
    return render(request, 'Finance/add_account.html', context)


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
