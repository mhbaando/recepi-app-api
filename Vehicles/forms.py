from django.utils.html import escape
from django import forms
from django.core.exceptions import ValidationError
from email_validator import validate_email


class vehicle_form(forms.Form):
    model_brand = forms.IntegerField()
    color = forms.IntegerField()
    origin = forms.IntegerField()
    cylinders = forms.IntegerField()
    year = forms.CharField(max_length=100, strip=True)
    hp = forms.CharField(max_length=100, strip=True)
    weight = forms.CharField(max_length=100, strip=True)
    registration_number = forms.CharField(max_length=100, strip=True)
    engine_number = forms.CharField(max_length=80, strip=True)
    owner_id = forms.IntegerField()
    passenger_seats = forms.CharField(max_length=80, strip=True)
    rv_number = forms.CharField(max_length=80, strip=True)

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                cleaned_data[field] = escape(
                    value)
        return cleaned_data


class update_form(forms.Form):
    vehicleID = forms.IntegerField()
    weight = forms.CharField(max_length=50, strip=True)
    hp = forms.CharField(max_length=50, strip=True)
    passenger_seats = forms.CharField(max_length=80, strip=True)
    engine_no = forms.CharField(max_length=80, strip=True)
    rv_number = forms.CharField(max_length=80, strip=True)
    color = forms.IntegerField()
    cylinder = forms.IntegerField()
    model_brand = forms.IntegerField()
    year = forms.IntegerField()
    origin = forms.IntegerField()

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                cleaned_data[field] = escape(
                    value)
        return cleaned_data


class assign_form(forms.Form):
    vehicleIdd = forms.IntegerField()
    code = forms.IntegerField()
    state = forms.IntegerField()
    type = forms.IntegerField()
    number = forms.CharField(max_length=80, strip=True)
    year = forms.CharField(max_length=80, strip=True)

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                cleaned_data[field] = escape(
                    value)
        return cleaned_data
