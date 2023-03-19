from django.urls import path
from . import views
from . import reports
from .mot import *

urlpatterns = [
    path("", views.register_vehicle, name="register-vehicle"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),
    path("vehicle-profile/<str:pk>/",
         views.vehicle_profile, name="vehicle-profile"),
    #     path('owner-search/<str:search>', views.seach_owner),
    path("register-tranfer/", views.tranfercreate),
    path('transfer-search/<str:search>', views.seach_transfer),
    path('transfer-searchh/<str:search>', views.seach_transferrr),
    path("registervehicle", views.register_vehicle, name="register-vehicle"),
    path("assignplate/", views.asign_plate, name="assignplate"),
    path('receipt_voucher/<str:search>',
         views.SearchReceiptVoucher, name='SearchReceiptVoucher'),

    path('updatevehicle/', views.update_vehicle),

    path("vehicle_info/<int:id>/",
         views.vehicle_plate_info),
    path("vehicle_plate_gen/",
         views.vehicle_plate_gen),



    path('findvehicle/<int:id>', views.find_vehicle),
    path('codeplate/', views.code_plate_name),



    path('searchcustomer/<str:search>',
         views. Searchcustomer, name=' Searchcustomer'),
    path('reports/search_vehicle/<str:search>', reports.Searchvehicle),
    path('reports/vehicle-report/<str:id>', reports.vehicle_report),

    # Mot URLs
    path('find_test_el/<int:id>', find_test_el),
    path('find_car/<str:search>', Searchvehicle),
    path('regsiter_mots/', register_mot, name="register_mot"),
    path('view_mots', view_mot, name='view_mot')

]
