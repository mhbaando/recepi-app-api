from django.urls import path
from . import views
# from .views import Assign_create,Transfercreate
# from .views import Assign_create
urlpatterns = [
    path("", views.register_vehicle, name="register-vehicle"),
    path("register-tranfer/", views.tranfercreate, name="transfer"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),
    # path("asignplate/", views.assign_plate, name="asign-plate"),
    path("vehicle-profile/<str:pk>/",
         views.vehicle_profile, name="vehicle-profile"),
    path('owner-search/<str:search>', views.seach_owner),
    path('transfer-search/<str:search>', views.seach_transfer),
    path('transfer-searchh/<str:search>', views.seach_transferrr),
    path("registervehicle", views.register_vehicle, name="register-vehicle"),
    path("assignplate/<str:pk>/", views.asign_plate, name="assignplate"),

    path('updatevehicle/', views.update_vehicle),

    path("vehicle_info/<int:id>/",
         views.vehicle_plate_info),



    path('findvehicle/<int:id>', views.find_vehicle),



    path('searchcustomer/<str:search>',
         views. Searchcustomer, name=' Searchcustomer'),

]
