from django.shortcuts import render


def unauthorized_view(request):
    return render(request, 'Base/403.html', {'pagTitle': 'An Authorized'})
