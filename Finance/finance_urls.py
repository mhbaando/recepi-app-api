from django.urls import path
from . import views


urlpatterns = [
    # Account End Points
    path('accounts', views.AccountsPage, name='AccountsPage'),
    path('add_account', views.AddAccount, name='AddAccount'),
    path('manage_accounts/<str:action>', views.ManageAccounts),
    path('find_reciept/<int:id>', views.find_reciept),
    path('update_account/', views.update_account),
    path('updatereciept/<int:id>', views.update_reviept),



    # Receipt End Points
    path('receipt', views.ReceiptPage, name='ReceiptsPage'),
    path('add_receipt', views.AddReceipt, name='AddReceipt'),
    path('receipt/<int:id>', views.receipt, name='receipt'),
    path('SearchReceiptVoucher/<str:search>',
         views.SearchReceiptVoucher, name='SearchReceiptVoucher'),
    path('findaccount/<str:id>', views.find_account),
    path('findrfrom/<str:name>', views.find_rcfrom),
    path('save_reciept/<str:action>', views.savereciept, name='savereciept'),
    path('updatereciept/', views.update_reviept),
    path('find_account/<int:name>', views.find_account),





]
