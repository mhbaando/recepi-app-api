from django.contrib.auth.decorators import login_required
from django.core.paginator import Paginator
from django.db.models import Q
from django.http import JsonResponse
from django.shortcuts import redirect, render


@login_required(login_url='Login')
def report_home(request):
    context = {
        'pageTitle': 'Reports'
    }

    return render(request, 'reports/report.html', context)
