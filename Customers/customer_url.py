from django.urls import path
from . import views, license, customer

urlpatterns = [
    # company urls
    path('company/', views.register_company, name='register_company'),
    path('company-views/', views.view_company, name='view_company'),
    path('company_block', views.block_company, name='comapny_block'),
    path('company/profile/<int:id>', views.company_profile, name="company_profile"),
    path('search_owner/<str:search>', views.search_engine),


    # License Urls
    path('register_license', license.NewLicense, name='NewLicense'),
    path('renew_license', license.ReNewLicense, name='ReNewLicense'),
    path('license_lists', license.LicenseLists, name='LicenseLists'),
    path('receipt_voucher/<int:search>',
         license.SearchReceiptVoucher, name='SearchReceiptVoucher'),
    path('customer_info/<int:id>', license.customer_info, name='customer_info'),
    path('manage_license/<int:id>', license.manage_license, name='manage_license'),

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
