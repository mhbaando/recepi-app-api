from django.urls import path
from . import views

urlpatterns = [
    path('customer/<int:id>', views.print_customer, name='print_customer'),
]
