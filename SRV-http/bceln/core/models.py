from django.db import models
from django.conf import settings
from django.contrib.auth.models import AbstractUser


class User(AbstractUser):
    birth_date = models.DateField(null=True, blank=True)
    
    def __str__(self):
        return self.get_full_name()
    
###### Test class ##########
class Member(models.Model):
    firstname = models.CharField(max_length=40)
    lastname = models.CharField(max_length=40)
    friendname = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True)
    file = models.FileField(upload_to='uploads/', blank=True) # File is automatically uploaded to MEDIA_ROOT/uploads/
    def __str__(self):
        return self.firstname + " " + self.lastname
######    END    ##########
    
class Sample(models.Model):
    product = models.CharField(max_length=100)
    batch = models.CharField(max_length=100)
    location = models.CharField(max_length=100)
    storage_temp = models.CharField(max_length=100)
    
    def __str__(self):
        return self.batch

class LabProtocol(models.Model):
    sample = models.ForeignKey(Sample, on_delete=models.CASCADE)
    analyst = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True)
    analyte = models.CharField(max_length=100)
    instructions = models.TextField()

    def __str__(self):
        return self.analyte

    
class SampleAnalysis (models.Model):
    lab_protocol = models.ForeignKey(LabProtocol, on_delete=models.CASCADE)
    requested_by = models.OneToOneField(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True)
    
    SAMPLE_ANALYSIS_STATUS = (
        ('REQ', 'Requested'),
        ('INP', 'In progress'),
        ('REJ', 'Rejected'),
        ('ONH', 'On hold'),
        ('APP', 'Approved'),
    )
    status = models.CharField(max_length=3, choices=SAMPLE_ANALYSIS_STATUS, default='')

    def __str__(self):
        return self.lab_protocol


class Instruments(models.Model):
    name = models.CharField(max_length=100)
    serial_no = models.CharField(max_length=100)
    model = models.CharField(max_length=100)
    manufacturer = models.CharField(max_length=100)
    calibration_freq_months = models.IntegerField()
    last_calibration_date = models.DateTimeField()
    owner = models.ForeignKey(settings.AUTH_USER_MODEL, on_delete=models.SET_NULL, blank=True, null=True)
    used_in = models.ManyToManyField(LabProtocol)
    
    def __str__(self):
        return self.name
    

class Reagents(models.Model):
    name = models.CharField(max_length=100)
    lot_no = models.CharField(max_length=100)
    manufacturer = models.CharField(max_length=100)
    expiry_date = models.DateTimeField()
    used_in = models.ManyToManyField(LabProtocol)
    
    def __str__(self):
        return self.name
