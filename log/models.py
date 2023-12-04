from django.db import models

# Create your models here.
class Log(models.Model):
	r_clsf_record_id=models.AutoField(primary_key=True)
	device_id = models.ForeignKey("device.Device",on_delete=models.CASCADE)
	CardName = models.CharField(max_length=100,default="-",null=True)
	InTime=models.DateTimeField(null=True)
	RecNo=models.IntegerField(default=0,null=True)
	RoomNumber=models.CharField(default="-",null=True,max_length=100)
	Status=models.IntegerField(default=0,null=True)
	Type=models.CharField(default="-",null=True,max_length=100)
	image_url=models.CharField(max_length=100,default="-",null=True)
	employee_id=models.ForeignKey("employee.Employee",on_delete=models.CASCADE,null=True)

