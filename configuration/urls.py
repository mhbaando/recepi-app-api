from django.contrib import admin
from django.urls import path, include
from django.conf import settings
from django.conf.urls.static import static
from Users.views import Login, Logout
from .views import unauthorized_view
from . import settings
urlpatterns = [
    path('admin/', admin.site.urls),
    path('',  include('Users.users_urls')),
    path('login', Login, name='Login'),
    path('logout/', Logout, name='Logout'),
    path('finance/',  include('Finance.finance_urls')),
    path('customer/',  include('Customers.customer_url')),
    path('vehicles/',  include('Vehicles.vehicle_urls')),
    path('anauthorized', unauthorized_view,  name="un_authorized"),

] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)


if settings.DEBUG:
    urlpatterns += static(
        settings.MEDIA_URL,
        document_root=settings.MEDIA_ROOT
    )
