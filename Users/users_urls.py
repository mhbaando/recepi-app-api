from django.urls import path
from .views import *


urlpatterns = [
    # Users
    path('add_users', Users, name='Users'),
    path('user_lists', UsersList, name='UsersList'),
    path('customers_list', CustomersList, name='CustomersList'),
    path('manage_users/<int:id>',
         ManageUsers, name='ManageUsers'),



    path('', Dashboard, name='Dashboard'),
]
