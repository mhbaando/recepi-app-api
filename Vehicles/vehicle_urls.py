from django.urls import path
from . import views
urlpatterns = [
    # vehicle Urls
    path("asignplate/", views.assign_aplate, name="asign-plate"),
    path("tranfer/", views.tranfer, name="transfer"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),
    path("registervehicle",views.register_vehicle,name="register-vehicle"),


]
