from django.forms import ModelForm
from .models import account



class accountform(ModelForm):
    class Meta:
        model =account
        fields = "__all__"


        