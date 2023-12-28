from datetime import datetime, timedelta
from django.db import models
from django.utils import timezone
from log.models import Log
from shift_management.models import ShiftAssign

# Create your models here.
class AttendanceReport(models.Model):
	ID=models.AutoField(primary_key=True)
	device_id = models.ForeignKey("devices.Devices",on_delete=models.CASCADE)
	group_id=models.ForeignKey("empgrp.Group",on_delete=models.CASCADE)
	employee_id=models.ForeignKey("employee.Employee",on_delete=models.CASCADE,null=True)
	username = models.CharField(max_length=100,default="-",null=True)
	InTime=models.DateTimeField(null=True)
	OutTime=models.DateTimeField(null=True)
	delay_minutes = models.IntegerField(default=0, null=True)
	total_work_minutes=models.IntegerField(default=0,null=True)
	cumalative_work_minutes=models.IntegerField(default=0,null=True)
	def save(self, *args, **kwargs):
		# Fetch the associated ShiftManagement record
		shift_assign = ShiftAssign.objects.filter(employee_id=self.employee_id).first()
		if shift_assign:
			shift_timing = shift_assign.shift_id
			if shift_timing:
				# Combine date from InTime with shift_beginning time
				expected_in_time = timezone.make_aware(datetime.combine(self.InTime.date(), shift_timing.shift_beginning))
				delay = max(self.InTime - expected_in_time, timedelta(0))
				self.delay_minutes = delay.total_seconds() // 60

		super().save(*args, **kwargs)




