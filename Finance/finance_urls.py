from django.urls import path
from . import views


urlpatterns = [
    # Account End Points
    path('accounts', views.AccountsPage, name='AccountsPage'),
    path('add_account', views.AddAccount, name='AddAccount'),
    path('manage_accounts/<str:action>', views.ManageAccounts),


    # Receipt End Points
    path('receipt', views.ReceiptPage, name='ReceiptsPage'),
    path('add_receipt', views.AddReceipt, name='AddReceipt'),
    path('receipt/<int:id>', views.receipt, name='receipt'),
    path('receipt_voucher/<str:search>',
         views.SearchReceiptVoucher, name='SearchReceiptVoucher'),



]
