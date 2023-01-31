from django.shortcuts import render
from django.core.paginator import Paginator


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
        'pageTitle': 'Craete Account',
    }
    return render(request, 'Finance/add_account.html', context)
