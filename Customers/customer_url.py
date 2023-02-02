from django.urls import path
from . import views

urlpatterns = [
    path('register/', views.register_company, name='register'),
    path('view/', views.view_company, name='view')
]
