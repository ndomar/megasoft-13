# Create your views here.
from django.http import HttpResponse
from django.template import Context, loader

from AddressBookapp.models import Contacts

def index(request):
    contact_list = Contacts.objects.filter(username=request.username)[:]
    template = loader.get_template('AddressBook/index.html')
    context= Context({
        'contact_list': contact_list,
    })
    return HttpResponse(template.render(context))
