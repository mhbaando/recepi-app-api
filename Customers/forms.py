from django import forms
from django.core.exceptions import ValidationError
from PIL import Image


# class PNGImageField(forms.ImageField):
#     def clean(self, value, initial=None):
#         image = super().clean(value, initial)
#         if image:
#             if not image.name.endswith('.png'):
#                 raise ValidationError('Only PNG  are allowed.')
#             try:
#                 with Image.open(image) as image:
#                     if image.format != 'PNG':
#                         raise ValidationError('Not a valid PNG image.')
#             except OSError:
#                 raise ValidationError('Not a valid image image.')
#         return image


gender_option = [
    ('Male', 'Male'),
    ('Female', 'Female')
]


class customer_from(forms.Form):
    firs_name = forms.CharField(max_length=20)
    second_name = forms.CharField(max_length=20)
    last_name = forms.CharField(max_length=20)
    fourth_name = forms.CharField(max_length=20)
    mother_name = forms.CharField(max_length=100)
    dob = forms.DateField()
    gender = forms.ChoiceField(choices=gender_option)
    bload_group = forms.IntegerField()
    nationality = forms.IntegerField()
    phone = forms.IntegerField()
    email = forms.EmailField()
    address = forms.CharField(max_length=100)
    state = forms.IntegerField()
    personal_id = forms.CharField()
    document_type = forms.IntegerField()
    # image = PNGImageField()

    def clean(self):
        cleaned_data = super().clean()
        if not self.is_valid():
            raise forms.ValidationError('Form is not valid.')
        return cleaned_data
