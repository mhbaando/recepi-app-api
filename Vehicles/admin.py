from django.contrib import admin
from . models import vehicle, model_brand, color, cylinder, plate, transfare_vehicles, type, code_plate, test, test_category, test_elements

# Register your models here.
admin.site.register(model_brand)
admin.site.register(color)
admin.site.register(cylinder)
admin.site.register(vehicle)
admin.site.register(plate)
admin.site.register(transfare_vehicles)
admin.site.register(type)
admin.site.register(code_plate)
admin.site.register(test)
admin.site.register(test_category)
admin.site.register(test_elements)
