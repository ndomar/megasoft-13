from django.conf.urls import patterns, url

from AddressBookapp import views

urlpatterns = patterns('',
    url(r'^home$', views.home, name='home'),
	url(r'^login$', views.login, name='login'),
	url(r'^check$', views.check, name='check'),
	url(r'^$', views.index, name='index'),
	url(r'^editcontact$', views.editcontact, name = 'editcontact'),
	url(r'^delcontact$', views.delcontact, name = 'delcontact'),
)


