from django.shortcuts import render
from django.contrib.auth.decorators import login_required

# Create your views here.


def Dashboard(request):
    context = {
        'pageTitle': 'Dashboard',
    }
    return render(request, 'dashboard.html', context)
