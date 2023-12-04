from django.db import models


# Create your models here.
class Device(models.Model):
    device_id=models.CharField(max_length=100,primary_key=True,null=False)
    device_name=models.CharField(max_length=100,null=False,default="-")
    location=models.CharField(max_length=100,null=True,default="-")
    device_ip=models.GenericIPAddressField(protocol='both',unpack_ipv4=True,null=True)
    group_id=models.ForeignKey("empgrp.Group",on_delete=models.CASCADE,null=True)
    active_status=models.CharField(default="inactive",max_length=100,null=False)
    
