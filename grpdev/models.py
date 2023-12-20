from django.db import models
from empgrp.models import Group
from devices.models import Devices


# Create your models here.
class GroupDevice(models.Model):
    id = models.AutoField(primary_key=True)
    group_id =   models.ForeignKey(Group,on_delete=models.CASCADE,related_name="group_group_id")
    device_id =  models.ForeignKey(Devices,on_delete=models.CASCADE,null=False)
    def __str__(self):
        return self.id

