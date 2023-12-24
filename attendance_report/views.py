from datetime import datetime, timedelta
from django.utils import timezone
from django.shortcuts import render
import pytz
from dmc.settings import MEDIA_DIR
from grpdev.models import GroupDevice
from log.models import Log
from structuedlog.models import StructuredLog
from structuedlog.serializers import StructuredLogSerializer
from empgrp.models import Group
from employee.models import Employee
from .models import AttendanceReport
from django.db.models import Q
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import AttendanceSerializer
from .models import AttendanceReport
from rest_framework import status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.pagination import PageNumberPagination
import csv
import os
from datetime import datetime, timedelta

from django.core.management.base import BaseCommand

# Create your views here.
def insert_attendance_log(device_id,employee_id,username,InTime):
	print("device_id :",device_id,"employee_id :",employee_id,"username :",username,"InTime :",InTime)
	group=GroupDevice.objects.filter(device_id=device_id).values_list("group_id",flat=True)
	group_id=Employee.objects.filter(employee_id=employee_id).values_list("group_id")
	# emp=Employee.objects.get(employee_id=employee_id)
	print("employee touple:",group_id[0])
	print("employee:",group_id[0][0])

	print("total group :",len(group_id))
	for i in range(len(group_id)):
		grp=Group.objects.get(group_id=group_id[0][i])
		print("staging log")
		print("structured intime :",InTime)
		# check_intime=AttendanceReport.objects.all()
		
		

		data = AttendanceReport(
			device_id=device_id,
			group_id=grp,
			employee_id=employee_id,
			username=username,
			InTime=InTime,
			OutTime=InTime,
			total_work_minutes=0,
			cumalative_work_minutes=0
		)
		data.save()

	return 
# Create your views here.
@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def attendanceReport(request):
	date_filter = request.GET.get('date', None)
	employee_id_filter = request.GET.get('employee_id', None)
	group_filter=request.GET.get('group_id', None)

	if request.method == 'GET':
		tasks = AttendanceReport.objects.all().order_by('-ID')
		# tasks = AttendanceReport.objects.filter(InTime__startswith=date_filter)
		# tasks = AttendanceReport.objects.filter(employee_id=employee_id_filter)

		if group_filter:
			tasks=tasks.filter(group_id=group_filter)
		if employee_id_filter:
			tasks=tasks.filter(employee_id=employee_id_filter)
		if date_filter:
			tasks=tasks.filter(InTime__startswith=date_filter)

		# serializer = AttendanceSerializer(tasks, many=True)
		paginator = PageNumberPagination()
		# paginator.page_size = 10  # Set the number of items per page
		paginator.page_size = int(request.GET.get('page_size', 15))

		result_page = paginator.paginate_queryset(tasks, request)

		serializer = AttendanceSerializer(result_page, many=True)

		return paginator.get_paginated_response(serializer.data)
		# return Response(serializer.data)
	elif request.method == 'POST':
		print("Request Data:", request.data)
		serializer = AttendanceSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			print("Saved Data:", serializer.data)
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		else:
			print("Errors:", serializer.errors)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	elif request.method == 'DELETE':
				print("inside delete ")
				delete_previous_log_data()
				return Response({"message":"successfully deleted"})



@api_view(['GET','POST','DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def attendance_with_id(request,pk):
	task1 = AttendanceReport.objects.filter(ID=pk).first()

	
	print("task : ",task1)
	if task1!=None:
		task = AttendanceReport.objects.get(ID=pk)
		if request.method == 'GET' :
			serializer = AttendanceSerializer(task, many=False)
			return Response(serializer.data)

		if request.method == 'POST':
			serializer = AttendanceSerializer(instance=task, data=request.data)
			if serializer.is_valid():
				serializer.save()
				return Response(serializer.data)
		elif request.method == 'DELETE':
				print("inside delete ")
				delete_previous_log_data()
				# task.delete()
				return Response({"message":"Log successfully deleted!"})
		
	else:
		return Response({"message":"Log id is not valid"})
	






	# views.py



@api_view(['GET'])
def find_employee_data(request):
	date_filter = request.GET.get('date', None)
	employee_id_filter = request.GET.get('employee_id', None)

	queryset = AttendanceReport.objects.all()

	if date_filter:
		# Use __startswith for partial match on the date
		queryset = queryset.filter(date__startswith=date_filter)

	if employee_id_filter:
		queryset = queryset.filter(Q(employee_id__icontains=employee_id_filter))

	serializer = AttendanceSerializer(queryset, many=True)
	print("inside search :")

	return Response(serializer.data)




def delete_previous_log_data():
	##delete attendance log
	    #  {
        #     "ID": 223,
        #     "username": "rezvi",
        #     "InTime": "2023-12-24T22:20:42+06:00",
        #     "OutTime": "2023-12-24T22:20:42+06:00",
        #     "total_work_minutes": 0,
        #     "cumalative_work_minutes": 0,
        #     "device_id": "DmcGate10",
        #     "group_id": 2,
        #     "employee_id": "1"
        # }


	six_months_ago = datetime.now() - timedelta(days=6 * 30)

	# Filter logs older than 6 months
	logs_to_delete = AttendanceReport.objects.filter(timestamp__lt=six_months_ago)

	# Export to CSV
	csv_filename = f'old_logs_till_{datetime.now()}_backup.csv'
	with open(csv_filename, 'w', newline='') as csvfile:
		fieldnames = ['ID', 'username', 'InTime','OutTime','total_work_minutes','cumalative_work_minutes','device_id','group_id','employee_id']  # Replace with actual field names
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

		# Write CSV header
		writer.writeheader()

		# Write log data to CSV
		for log in logs_to_delete:
			writer.writerow({'ID':log.ID, 'username':log.username, 'InTime':Log.InTime,'OutTime':log.OutTime,'total_work_minutes':log.total_work_minutes,'cumalative_work_minutes':log.cumalative_work_minutes,'device_id':log.device_id,'group_id':log.group_id,'employee_id':log.employee_id})  # Replace with actual field values

	# Delete logs
	# logs_to_delete.delete()
	path=str(MEDIA_DIR)+f'/{csv_filename}'
	# Optionally, move the CSV file to a desired location
	print("path :",path)
	os.rename(csv_filename, path)
       

