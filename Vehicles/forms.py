from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import vehicle,transfare_vehicles,plate



class Vehicleform(ModelForm):
    class Meta:
        model =vehicle
        fields = "__all__"

class Transferform(ModelForm):
    class Meta:
        model =transfare_vehicles
        fields = "__all__"   


class Plateform(ModelForm):
    class Meta:
        model =plate
        fields = "__all__" 
