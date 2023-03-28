from django.forms import ModelForm, ValidationError
from django import forms
import re
from django.utils.html import escape
# Account data cleaning


class account_form(forms.Form):
    acc_number = forms.IntegerField()
    acc_name = forms.CharField(max_length=25, strip=True)
    acc_amount = forms.IntegerField()
    accountype = forms.IntegerField()

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                if isinstance(value, (int, float)):
                    cleaned_data[field] = escape(value)
                else:
                    print(value)
                    cleaned_data[field] = re.sub(
                        '[^0-9a-zA-Z]+', '', value)
        return cleaned_data


class account_edit(forms.Form):
    account_id = forms.IntegerField()
    accnumber = forms.IntegerField()
    accountype = forms.IntegerField()
    accname = forms.CharField(max_length=25, strip=True)
    amount = forms.IntegerField()

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if value:
                if type(value) is not str:
                    cleaned_data[field] = escape(value)
                else:
                    cleaned_data[field] = re.sub(
                        '[^0-9a-zA-Z]+', '', str(value))
        return cleaned_data


#  reciept data cleaning
class receipt_form(forms.Form):
    rv_number = forms.IntegerField()
    reason = forms.CharField()
    rvamount = forms.IntegerField()
    personal_id = forms.CharField()

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        for field in self.fields:
            value = cleaned_data.get(field)
            if type(value) is not str:
                cleaned_data[field] = escape(value)
            else:
                cleaned_data[field] = re.sub(
                    '[^0-9a-zA-Z]+', '', str(value))
        return cleaned_data

# recipt edit form


class reciept_edit(forms.Form):

    recievedfrom = forms.CharField(max_length=20, strip=True)
    reason = forms.CharField(strip=True)

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
