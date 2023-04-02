"""
Django Admin Customization
"""
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin as BaseUserAdmin
from django.utils.translation import gettext_lazy as _
from core import models


class UserAdmin(BaseUserAdmin):
    """Defin the admin pages for users"""
    ordering=['id']
    list_display=['email','name']
    fieldsets=(
        ('Basic Info',{'fields':('email','password','name')}),
        (
            _('Permissions'),{
                'fields':(
                    'is_active',
                    'is_staff',
                    'is_superuser'
                )
            }
        ),
        (_('Important dates'),{
            'fields':('last_login',)
        }),
    )
    readonly_fields = ['last_login']

    # for add user
    add_fieldsets = (
        (None,{
        'classes':('wide',),
        'fields':(
        'email',
        'password1',
        'password2',
        'name',
        'is_active',
        'is_staff',
        'is_superuser'
        )
        }),
    )

# when you register you tell by pass
# 2nd argument to user the above custom
admin.site.register(models.User, UserAdmin)
