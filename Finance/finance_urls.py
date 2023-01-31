from django.urls import path
from . import views


urlpatterns = [
    path('accounts', views.AccountsPage, name='AccountsPage'),
    path('add_account', views.AddAccount, name='AddAccount'),
]



# Horus E1-FP
# CIZW214760138
# 10.128.1.250