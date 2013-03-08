# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render
from AddressBookapp.models import Users, Contacts

def home(request):
	return render(request, 'AddressBookapp/home.html')
	
def login(request):
	user_names = Users.objects.all()
	return render(request, 'AddressBookapp/login.html', {'user_names' : user_names})
	
def check(request):
	username = request.POST['username']
	pwd = request.POST['password']
	try:
		u = Users.objects.get(user_name = username, password = pwd)
		id = u.id
		return render(request, 'AddressBookapp/Contacts.html', {"id":id})
	except :
		return render(request, 'AddressBookapp/login.html')