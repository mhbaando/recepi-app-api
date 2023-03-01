from django.urls import path
from . import views, license, customer

urlpatterns = [
    # company urls
    path('company/', views.register_company, name='register_company'),
    path('company-views/', views.view_company, name='view_company'),
    path('company_block', views.block_company, name='comapny_block'),
    path('company_unblock/<int:id>', views.unblockcompany, name='comapny_unblock'),

    path('company/profile/<int:id>', views.company_profile, name="company_profile"),
    path('search_owner/<str:search>', views.search_engine),
    path('updatecompany/', views.update_company),
    path('findcompany/<int:id>', views.find_company),
    path('searchcustomer/<str:search>',
         views. Searchcustomer, name=' Searchcustomer'),




    # License Urls
    path('register_license', license.NewLicense, name='NewLicense'),
    path('renew_license', license.ReNewLicense, name='ReNewLicense'),
    path('license_lists', license.LicenseLists, name='LicenseLists'),
    path('receipt_voucher/<str:search>',
         license.SearchReceiptVoucher, name='SearchReceiptVoucher'),
    path('customer_info/<int:id>', license.customer_info, name='customer_info'),
    path('manage_license/<int:id>', license.manage_license, name='manage_license'),
    #     path('find_liscence/<int:id>', license.find_liscence, name='find_liscence'),
    #     path('renewlicense/<int:id>', license.renew_license),
    path('find_liscence/<int:id>', license.find_liscence, name='find_liscence'),
    path('edit_liscence/<int:id>', license.edit_liscence),
    path('status_licenses/<int:id>', license.find_status, name='find_license'),
    path('edit_manage/<int:id>', license.edit_manage),

    # customers
    # register customer
    path('', customer.register_customer, name='register_customer'),
    path('activate', customer.activate_customer, name='activate_customer'),
    path('list', customer.customer_list, name="customer_list"),
    path('updatecustomer/', customer.update_customer),
    path('profile/<int:id>', customer.customer_profile, name="customer_profile"),
    path('findcustomer/<int:id>', customer.find_customer),
    # TODO: search here
]
