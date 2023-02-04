from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from Users.views import Login
urlpatterns = [
    # path('admin/', admin.site.urls),
    path('',  include('Users.users_urls')),
    path('login' , Login , name='Login'),
    path('finance/',  include('Finance.finance_urls')),
    path('customer/',  include('Customers.customer_url')),
    path('vehicles/',  include('Vehicles.vehicle_urls')),
]


if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
