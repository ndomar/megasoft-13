# Create your views here.
from django.shortcuts import render_to_response,HttpResponse
from AddressBookapp.models import *
from AddressBookapp.forms import *
import datetime

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
	
def login(request):
	return render_to_request('login.html')
	
def register(request):
    error = False
    if 'name' in request.GET:
        name = request.GET['name']
        if not name:
            error = True
        else:
            user1 = Users(user_name= request.GET['user_name'],name=request.GET['name'],email=request.GET['user_email'],password=request.GET['pass'])
            user1.save()
            return render_to_response('addContact.html',
                {'msg': 'You have successfully registered! *wohoo*'})
    return render_to_response('register_form.html',
        {'error': error})
        
def add_contact2(request):
	if request.method == 'POST':
		form = ContactForm(request.POST)
		if form.is_valid():
			f = form.cleaned_data
			contact= Contacts(name= f['name'],email=f['email'],number= f['number'],address= f['address'])
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
			contact1 = Contacts(name= request.GET['name'],email= request.GET['user_email'],number= request.GET['num'],address=request.GET['addrs'])
			contact1.save()
			return render_to_response('index.html',{'msg': 'You have successfully added a new contact! *wohoo*'})
    return render_to_response('addcontact.html',
        {'error': error})
        
def delete_contact(request):
    error = False
    if 'name' in request.GET:
        name = request.GET['name']
        if not name:
            error = True
        else:
            contact1=Contacts.objects.filter(name__icontains=name)
            if contact1:
            	Contacts.objects.filter(name__icontains=name).delete()
            
            return render_to_response('index.html',
                {'msg': 'You have successfully deleted a contact!'})
    return render_to_response('index.html',
        {'error': error})
        

