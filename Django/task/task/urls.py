from django.conf.urls import patterns, include, url
from AddressBookapp.views import hello, current_datetime, hours_ahead, register_form, register
from AddressBookapp.views import * 

>>>>>>> f31658c3b0ea4b890452f38fda5d8b30d692c05f

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    (r'^AddressBookapp/',include('AddressBookapp.urls')),
    ('^hello/$', hello),
    (r'^time/$', current_datetime),
    (r'^time/plus/(\d{1,2})/$', hours_ahead),
    (r'^register-form/$',register_form),
    (r'^register/$',register),
    (r'^add_contact/$', add_contact),
    (r'^addcontact/$', add_contact),
    #(r'^ViewAddrsBk/$', viewAddrsBk),
)
