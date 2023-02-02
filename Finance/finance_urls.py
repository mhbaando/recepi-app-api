from django.urls import path
from . import views


urlpatterns = [
    path('accounts', views.AccountsPage, name='AccountsPage'),
    path('add_account', views.AddAccount, name='AddAccount'),
    path('receipt', views.ReceiptPage, name='ReceiptsPage'),
    path('add_receipt', views.AddReceipt, name='AddReceipt'),
]
