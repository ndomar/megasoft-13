from django.conf.urls import patterns, url

from AddressBookapp import views

urlpatterns = patterns('',
    url(r'^$', views.index, name='index')
)
