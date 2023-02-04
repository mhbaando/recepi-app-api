from django.forms import ModelForm
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from .models import vehicle



class Vehicleform(ModelForm):
    class Meta:
        model =vehicle
        fields = "__all__"