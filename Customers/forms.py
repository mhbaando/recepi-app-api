import re
from django.utils.html import escape
from django import forms
from django.core.exceptions import ValidationError
from email_validator import validate_email
import re

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
                'Invalid Phone Number')
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
                cleaned_data[field] = re.sub('[^0-9a-zA-Z]+', '-', value)
        return cleaned_data

# customer edit form sanitizer


class customer_edit(forms.Form):
    first_name = forms.CharField(max_length=20, strip=True)
    second_name = forms.CharField(max_length=20, strip=True)
    last_name = forms.CharField(max_length=20, strip=True)
    fourth_name = forms.CharField(max_length=20, strip=True)
    full_name = forms.CharField(max_length=80, strip=True)
    mother_name = forms.CharField(max_length=60, strip=True)
    personal_id = forms.CharField(max_length=16, strip=True)
    gender = forms.ChoiceField(choices=gender_option)
    blood_group = forms.IntegerField()
    nationality = forms.IntegerField()
    email = forms.CharField(max_length=50, strip=True)
    phone = forms.CharField(max_length=15, strip=True)
    dob = forms.DateField()
    state = forms.IntegerField()
    address = forms.CharField(max_length=100, strip=True)
    customer_id = forms.IntegerField()

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if not phone.isdigit():
            raise forms.ValidationError(
                'Invalid Phone Number')
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
                cleaned_data[field] = re.sub('[^0-9a-zA-Z]+', '-', value)
        return cleaned_data


# Company data cleaning
class company_form(forms.Form):
    cname = forms.CharField(max_length=100, strip=True)
    rnumber = forms.CharField(max_length=20, strip=True)
    website = forms.CharField(max_length=30, strip=True)
    owner = forms.IntegerField()
    phone = forms.IntegerField()
    email = forms.CharField(max_length=50, strip=True)
    address = forms.CharField(max_length=100, strip=True)
    state = forms.IntegerField()
    desc = forms.CharField(max_length=250, strip=True)

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if type(phone) is not int:
            raise forms.ValidationError(
                'Invalid Phone Number')
        return phone

    def clean_state(self):
        state = self.cleaned_data['state']
        if type(state) is not int:
            raise forms.ValidationError(
                'Invalid State')
        return state

    def clean_owner(self):
        owner = self.cleaned_data['owner']
        if type(owner) is not int:
            raise forms.ValidationError(
                'Invalid Owner')
        return owner

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
                if type(value) is int:
                    cleaned_data[field] = escape(value)
                else:
                    cleaned_data[field] = re.sub('[^0-9a-zA-Z]+', '-', value)
        return cleaned_data


# Company edit form
class company_edit(forms.Form):

    company_id = forms.IntegerField()
    c_name = forms.CharField(max_length=20, strip=True)
    cphone = forms.CharField(max_length=20, strip=True)
    cemail = forms.CharField(max_length=20, strip=True)
    caddress = forms.CharField(max_length=20, strip=True)
    cwebsite = forms.CharField(max_length=20, strip=True)
    cregister = forms.CharField(max_length=20, strip=True)
    cstate = forms.IntegerField()

    def clean_phone(self):
        phone = self.cleaned_data['phone']
        if not phone.isdigit():
            raise forms.ValidationError(
                'Invalid Phone Number')
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
                cleaned_data[field] = re.sub('[^0-9a-zA-Z]+', '-', value)
        return cleaned_data


# Account data cleaning

class account_form(forms.Form):
    acc_number = forms.CharField(max_length=20, strip=True)
    acc_name = forms.CharField(max_length=25, strip=True)
    acc_amount = forms.CharField(max_length=25, strip=True)
    accountype = forms.CharField(max_length=20, strip=True)

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


class account_edit(forms.Form):
    account_id = forms.IntegerField()
    accnumber = forms.CharField(max_length=25, strip=True)
    accountype = forms.CharField(max_length=25, strip=True)
    accname = forms.CharField(max_length=25, strip=True)
    amount = forms.CharField(max_length=25, strip=True)

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


#  reciept data cleaning
class receipt_form(forms.Form):
    amount = forms.CharField(max_length=20, strip=True)
    reason = forms.CharField(max_length=20, strip=True)

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

# recipt edit form


class reciept_edit(forms.Form):

    amount = forms.CharField(max_length=20, strip=True)
    reason = forms.CharField(max_length=20, strip=True)

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


# Account data cleaning

class account_form(forms.Form):
    acc_number = forms.CharField(max_length=20, strip=True)
    acc_name = forms.CharField(max_length=25, strip=True)
    acc_amount = forms.CharField(max_length=25, strip=True)
    accountype = forms.CharField(max_length=20, strip=True)

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


class account_edit(forms.Form):
    account_id = forms.IntegerField()
    accnumber = forms.CharField(max_length=25, strip=True)
    accountype = forms.CharField(max_length=25, strip=True)
    accname = forms.CharField(max_length=25, strip=True)
    amount = forms.CharField(max_length=25, strip=True)

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


#  reciept data cleaning
class receipt_form(forms.Form):
    amount = forms.CharField(max_length=20, strip=True)
    reason = forms.CharField(max_length=20, strip=True)

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

# recipt edit form


class reciept_edit(forms.Form):

    amount = forms.CharField(max_length=20, strip=True)
    reason = forms.CharField(max_length=20, strip=True)

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
