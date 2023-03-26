from django.utils.html import escape
from django import forms
from django.core.exceptions import ValidationError
from pydantic import validate_email

gender_option = [
    ('Male', 'Male'),
    ('Female', 'Female')
]


class customer_from(forms.Form):
    first_name = forms.CharField(max_length=20, strip=True)
    second_name = forms.CharField(max_length=20, strip=True)
    last_name = forms.CharField(max_length=20, strip=True)
    fourth_name = forms.CharField(max_length=20, strip=True)
    mother_name = forms.CharField(max_length=100, strip=True)
    dob = forms.DateField()
    gender = forms.ChoiceField(choices=gender_option)
    blood_group = forms.IntegerField()
    nationality = forms.IntegerField()
    phone = forms.CharField(max_length=15, strip=True)
    email = forms.CharField(max_length=50, strip=True)
    address = forms.CharField(max_length=100, strip=True)
    state = forms.IntegerField()
    personal_id = forms.CharField(max_length=16, strip=True)
    document_type = forms.IntegerField()

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if not phone.isdigit():
            raise forms.ValidationError(
                'Phone number should contain only digits.')
        return phone

    def clean_email(self):
        email = self.cleaned_data['email']
        try:
            validate_email(email)
        except ValidationError:
            raise forms.ValidationError('Invalid email address.')
        return email

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                cleaned_data[field] = escape(
                    value)[:self.fields[field].max_length]
        return cleaned_data
