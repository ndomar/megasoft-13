# Create your views here.
from django.http import HttpResponse
from django.shortcuts import render, render_to_response, HttpResponse
from AddressBookapp.models import *
from AddressBookapp.forms import *
import datetime
from django.template import Context, loader

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
		return render(request, 'AddressBookapp/index.html', {"id":id})
	except :
		fail = "Wrong Password Or Username Please Try Again"
		return render(request, 'AddressBookapp/login.html', {'fail':fail})

def delcontact(request, ContactID):
	Contact = Contacts.objects.get(id = ContactID) 
	if request.POST :
		if "delete" in request.POST:
			Contacts.objects.get(id = ContactID).delete()
			return render(request, 'AddressBook/index.html')
		elif "edit" in request.POST:
			return render(request, 'AddressBook/editcontact.html', {'Contact' : Contact})
		
def editcontact(request, ContactID):
	c = Contacts.objects.get(id = ContactID)
	c.name = request.POST['name']
	c.number = request.POST['number']
	c.email = request.POST['number']
	c.address = request.POST['address']
	done = "Done !"
	return render(request, 'AddressBook/editcontact.html', {"done" : done})
		
def hello(request):
    return HttpResponse("Hello, world!")
    
def current_datetime(request):
    now = datetime.datetime.now()
    return render_to_response('current_time.html',{ 'current_date':now})
    
def hours_ahead(request, offset):
    try:
        offset = int(offset)
    except ValueError:
        raise Http404()
    dt = datetime.datetime.now() + datetime.timedelta(hours=offset)
    html = "<html><body>In %s hour(s), it will be %s.</body></html>" % (offset, dt)
    return HttpResponse(html)
    
def register_form(request):
	return render_to_response('register-form.html')
	
def register(request):
    error = False
    if 'name' in request.GET:
        name = request.GET['name']
        if not name:
            error = True
        else:
            user1 = Users(request.GET['user_name'],request.GET['name'],request.GET['user_email'],request.GET['pass'])
            return render_to_response('addContact.html',
                {'msg': 'You have successfully registered! *wohoo*'})
    return render_to_response('register_form.html',
        {'error': error})

def index(request):
    contact_list = Contacts.objects.filter(user_name=request.username)[:]
    template = loader.get_template('AddressBook/index.html')
    context= Context({
        'contact_list': contact_list,
    })
    return HttpResponse(template.render(context))
        
def add_contact2(request):
	if request.method == 'POST':
		form = ContactForm(request.POST)
		if form.is_valid():
			f = form.cleaned_data
			contact= Contacts(f['name'],f['email'],f['number'],f['address'])
			return render_to_response('viewAddrsBK.html',{'msg':'Contact has been succesfully added'})
	else:
		form = ContactForm()
	return render_to_response('addcontact.html', {'form': form})
	
def add_contact(request):
    error = False
    if 'name' in request.GET:
        name = request.GET['name']
        if not name:
            error = True
        else:
            contact1 = Contacts(request.GET['name'],request.GET['user_email'],request.GET['num'],request.GET['addrs'])
            return render_to_response('viewAddrsBk.html',
                {'msg': 'You have successfully added a new contact! *wohoo*'})
    return render_to_response('addcontact.html',
        {'error': error})