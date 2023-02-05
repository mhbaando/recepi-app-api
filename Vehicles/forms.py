from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import vehicle,transfare_vehicles



class Vehicleform(ModelForm):
    class Meta:
        model =vehicle
        fields = "__all__"

class Transferform(ModelForm):
    class Meta:
        model =transfare_vehicles
        fields = "__all__"        