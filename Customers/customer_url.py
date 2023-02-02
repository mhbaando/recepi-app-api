from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_company, name='register'),

    path('company-views/', views.view_company, name='view_company'),
    path('company detail/', views.detail_company, name='detail_company'),
    path('company block/', views.block_company, name='comapny-block'),
    path('company profile/', views.profile, name='comapny-profile'),

]
