from django.urls import path
from . import views
from .views import Register_create
urlpatterns = [
    # vehicle Urls
    path("asignplate/", views.assign_aplate, name="asign-plate"),
    path("tranfer/", views.tranfer, name="transfer"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),
    path("registervehicle",Register_create.as_view(),name="register-vehicle"),


]
