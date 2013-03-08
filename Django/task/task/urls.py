from django.conf.urls import patterns, include, url
from AddressBookapp.views import hello, current_datetime, hours_ahead, register_form, register

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
)
