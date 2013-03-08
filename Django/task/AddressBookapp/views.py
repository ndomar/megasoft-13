# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader
from django.shortcuts import render, render_to_response, HttpResponse
from AddressBookapp.models import *
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
		return render(request, 'AddressBookapp/Contacts.html', {"id":id})
	except :
		fail = "Wrong Password Or Username Please Try Again"
		return render(request, 'AddressBookapp/login.html', {'fail':fail})

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
        
from .forms import ModelFormWithFileField

def upload_file(request):
    if request.method == 'POST':
        form = ModelFormWithFileField(request.POST, request.FILES)
        if form.is_valid():
            # file is saved
            form.save()
            return HttpResponseRedirect('/success/url/')
    else:
        form = ModelFormWithFileField()
    return render(request, 'upload.html', {'form': form})
    
def search_form(request):
    return render_to_response('search_form.html')

