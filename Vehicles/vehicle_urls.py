from django.urls import path
from . import views, license
urlpatterns = [
    #vehicle Urls
    path("registervehicle", views.register_vehicle, name="register-vehicle"),
    path("asignplate/", views.assign_aplate, name="asign-plate"),
    path("tranfer/", views.tranfer, name="transfer"),
    path("viewvehicle/", views.view_vehicle, name="veiw-vehicle"),

    # License Urls
     path('register_license', license.NewLicense, name='NewLicense' ),
     path('renew_license', license.ReNewLicense, name='ReNewLicense' ),
     path('license_lists', license.LicenseLists, name='LicenseLists' ),
]
