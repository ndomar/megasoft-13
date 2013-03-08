from django.conf.urls import patterns, include, url
from AddressBookapp.views import * 


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    ('^hello/$', hello),
    (r'^time/$', current_datetime),
    (r'^time/plus/(\d{1,2})/$', hours_ahead),
    (r'^register-form/$',register_form),
    (r'^register/$',register),
    (r'^add_contact/$', add_contact),
    (r'^addcontact/$', add_contact),
    #(r'^ViewAddrsBk/$', viewAddrsBk),
)


    # Examples:
    
    # url(r'^$', 'task.views.home', name='home'),
    # url(r'^task/', include('task.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),

