from django.urls import path
from . import views, license

urlpatterns = [
    # company urls
    path('company/', views.register_company, name='register_company'),
    path('company-views/', views.view_company, name='view_company'),
    path('company_block/', views.block_company, name='comapny_block'),
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
    path('', views.register_customer, name='register_customer'),
    path('activate', views.activate_customer, name='activate_customer'),
    path('list', views.customer_list, name="customer_list"),
    path('profile/<int:id>', views.customer_profile, name="customer_profile")
    # TODO: search here
]
