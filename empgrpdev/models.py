from django.db import models
from empgrp.models import Group
from device.models import Device


# Create your models here.
class GroupByDevice(models.Model):
    id = models.AutoField(primary_key=True)
    # group_id =   models.ForeignKey(Group,on_delete=models.CASCADE, null=True, blank=True)
    # device_ip =  models.ForeignKey(Device,on_delete=models.CASCADE, null=True, blank=True)
    def __str__(self):
        return self.id

