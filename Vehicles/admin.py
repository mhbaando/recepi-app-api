from django.contrib import admin
from . models import vehicle, model_brand, color, cylinder, plate, transfare_vehicles, type

# Register your models here.
admin.site.register(model_brand)
admin.site.register(color)
admin.site.register(cylinder)
admin.site.register(vehicle)
admin.site.register(plate)
admin.site.register(transfare_vehicles)
admin.site.register(type)
