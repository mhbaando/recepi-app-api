from django.contrib import admin
from . models import customer,blood_group,personal_id_type,federal_state,countries

# Register your models here.
admin.site.register(blood_group)
admin.site.register(personal_id_type)
admin.site.register(customer)
admin.site.register(federal_state)
admin.site.register(countries)
