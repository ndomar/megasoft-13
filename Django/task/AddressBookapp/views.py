# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader
from django.shortcuts import render_to_response,HttpResponse
from AddressBookapp.models import *
import datetime

def index(request):
    contact_list = Contacts.objects.get(username=request.id).contact_set.all()
    template = loader.get_template('AddressBookapp/index.html')
    context= Context({
        'contact_list': contact_list,
    })
    return HttpResponse(template.render(context))

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
            user1 = Users(request.GET['user_name'],request.GET['name'],request.GET['user_email'],request.GET['pass'])
            return render_to_response('viewAddrsBk.html',
                {'msg': 'You have successfully registered! *wohoo*'})
    return render_to_response('register_form.html',
        {'error': error})

def upload 
        
        