from django.forms import ModelForm
from django import forms
import re
from django.utils.html import escape
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
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
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', value)
        return cleaned_data
