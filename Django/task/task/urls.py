from django.conf.urls import patterns, include, url
<<<<<<< HEAD
=======
from AddressBookapp.views import hello, current_datetime, hours_ahead,register_form,register

>>>>>>> 86a8ac4ee0b9fbb7f60f7d40bc36dbd8ac08e03c

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
<<<<<<< HEAD
    url(r'^AddressBookapp/', include('AddressBookapp.urls')),
=======
    ('^hello/$', hello),
    (r'^time/$', current_datetime),
    (r'^time/plus/(\d{1,2})/$', hours_ahead),
    (r'^register-form/$',register_form),
    (r'^register/$',register),
>>>>>>> 86a8ac4ee0b9fbb7f60f7d40bc36dbd8ac08e03c
)
