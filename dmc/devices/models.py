from django.db import models


# Create your models here.
class Devices(models.Model):
    device_id=models.CharField(max_length=100,primary_key=True,null=False)
    device_name=models.CharField(max_length=100,null=False,default="-")
    location=models.CharField(max_length=100,null=True,default="-")
    device_ip=models.GenericIPAddressField(protocol='both',unpack_ipv4=True,null=True)
    active_status=models.CharField(default="inactive",max_length=100,null=False)
    def __str__(self):
        return self.device_id
    
