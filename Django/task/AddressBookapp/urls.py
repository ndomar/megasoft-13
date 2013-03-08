from django.conf.urls import patterns, url

from AddressBookapp import views

urlpatterns = patterns('',
    url(r'^home$', views.home, name='home'),
	url(r'^login$', views.login, name='login'),
	url(r'^check$', views.check, name='check'),
)