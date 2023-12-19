from rest_framework import serializers
from .models import Employee,TrainEmployeeFromCSV

class EmployeeSerializer(serializers.ModelSerializer):
	class Meta:
		model = Employee
		fields ='__all__'

class TrainEmployeeFromCSVSerializer(serializers.ModelSerializer):
	class Meta:
		model = TrainEmployeeFromCSV
		fields="__all__"
