from django import forms

class ContactForm(forms.Form):
    name = forms.CharField()
    email = forms.EmailField(required=True)
    number = forms.CharField()
    address = forms.CharField()