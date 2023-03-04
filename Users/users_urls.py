from django.urls import path
from .views import *


urlpatterns = [
    # Users
    path('add_users', Users, name='Users'),
    path('user_lists', UsersList, name='UsersList'),
    path('customers_list', CustomersList, name='CustomersList'),
    path('manage_users/<str:action>',
         ManageUsers, name='ManageUsers'),
    path('find_user/<int:id>', find_user),
    path('user_activation/<str:action>/<int:id>', user_activation),


    # Audit and logs
    path('audit_trials', AuditTrials, name='AuditTrials'),
    path('error_logs', ErrorLogs, name='ErrorLogs'),
    path('manage_error_log/<str:action>', ManageErrorLogs),

    # Roles
    path('user_roles_report', ViewUserRolesReportPage, name='UserRolesReport'),
    path('search_role', SearchRole, name='SearchRole'),
    path('roles_report', ViewRolesReportPage, name='RolesReport'),
    path('single_roles', ViewRolesPage, name='SingleRoles'),
    path('group_roles', ViewGroupRolesPage, name='GroupRoles'),
    path('manage_group', ViewManageGroupPage, name='ManageGroup'),
    path('edit_group/<int:group_id>', ViewEditGroupPage, name='EditGroup'),
    path('manage_permission/<str:id>',
         ManagePermission, name='ManageRoles'),
    path('manage_permission_report',
         PermissonReport, name='PermissonReport'),
    path('manage_group_permission/<str:id>/<str:_id>',
         ManageGroupPermission, name='ManageGroups'),
    path('manage_group/<str:id>',
         ManageGroup),
    path('rename_group',
         RenameGroup),

    path('search_engine/<str:search>', SearchEngine),


    path('', Dashboard, name='Dashboard'),
    path('chart/', get_chart_data),
    path('updateuser/', updateUser),
]
