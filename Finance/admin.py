from django.contrib import admin
from .models import receipt_voucher,account_types,account

# Register your models here.
admin.site.register(receipt_voucher)
admin.site.register(account_types)
admin.site.register(account)