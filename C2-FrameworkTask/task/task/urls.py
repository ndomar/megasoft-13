from django.conf.urls import patterns, include, url
from AddressBookapp.views import hello


# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
    ('^hello/$',hello),
)


    # Examples:
    
    # url(r'^$', 'task.views.home', name='home'),
    # url(r'^task/', include('task.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),

