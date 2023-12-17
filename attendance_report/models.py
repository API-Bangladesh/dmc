from django.db import models

# Create your models here.
class AttendanceReport(models.Model):
	ID=models.AutoField(primary_key=True)
	device_id = models.ForeignKey("devices.Devices",on_delete=models.CASCADE)
	group_id=models.ForeignKey("empgrp.Group",on_delete=models.CASCADE)
	employee_id=models.ForeignKey("employee.Employee",on_delete=models.CASCADE,null=True)
	username = models.CharField(max_length=100,default="-",null=True)
	InTime=models.DateTimeField(null=True)
	OutTime=models.DateTimeField(null=True)
	total_work_minutes=models.IntegerField(default=0,null=True)
	cumalative_work_minutes=models.IntegerField(default=0,null=True)



