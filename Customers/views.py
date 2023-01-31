from django.shortcuts import render
from django.contrib.auth.decorators import login_required
# Create your views here.
# company


@login_required(login_url='user_login')
def register_company(request):
    context = {
        'title': 'register company'
    }
    return render(request, 'Company/register.html', context)


@login_required(login_url='user_login')
def view_company(request):
    context = {
        'title': 'view company'
    }
    return render(request, 'company/view.html', context)
