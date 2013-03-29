from django.db import models

# Create your models here.
class Users(models.Model):
    name = models.CharField(max_length=200)
    user_name = models.CharField(max_length=100,unique=True)
    email = models.EmailField(max_length=300)
    password= models.CharField(max_length=200)         
    def __unicode__(self):
        return self.user_name
    
class Contacts(models.Model):
    user = models.ForeignKey(Users)
    name= models.CharField(max_length=200)
    email = models.EmailField(max_length=300)
    number=models.IntegerField(default=0)
    address=models.CharField(max_length=300)
    def __unicode__(self):
        return '%s' % (self.name)