from django.urls import path
from . import views, license
urlpatterns = [

    # License Urls
     path('register_license', license.NewLicense, name='NewLicense' ),
     path('renew_license', license.ReNewLicense, name='ReNewLicense' ),
     path('license_lists', license.LicenseLists, name='LicenseLists' ),
]
