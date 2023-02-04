from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_company, name='register_company'),

    path('company-views/', views.view_company, name='view_company'),
    path('company_detail/', views.detail_company, name='detail_company'),
    path('company_block/', views.block_company, name='comapny_block'),
    path('company_profile/', views.profile, name='comapny_profile'),


    # customers
    # register customer
    path('', views.register_customer, name='register_customer',)
]
