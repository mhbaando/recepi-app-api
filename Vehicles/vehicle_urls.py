from django.urls import path
from . import views
from .views import Assign_create
urlpatterns = [
    # vehicle Urls
    # path("asignplate/", views.assign_aplate, name="asign-plate"),
    path("tranfer/", views.tranfercreate, name="transfer"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),
    path("registervehicle",views.register_vehicle,name="register-vehicle"),
    # path("registervehicle",views.register_vehicle,name="register-vehicle"),
    
    path("asignplate/",Assign_create.as_view(),name="asign-plate"),
    


]
