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
		check_db=AttendanceReport.objects.all()
		if len(check_db)>0:
			check_intime_last=AttendanceReport.objects.filter(employee_id=employee_id).values_list("InTime",flat=True).order_by("-InTime").last()
			check_intime_first=AttendanceReport.objects.filter(employee_id=employee_id).values_list("InTime",flat=True).order_by("-InTime").first()

			print("check_intime_last :",check_intime_last)
			print("check_intime_first :",check_intime_first)


			# Example usage:
		if is_within_shift_time(InTime):
			print("The time is within the specified range.")
		else:
			print("The time is outside the specified range.")
			

		


	

		
		

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

		# Save the instance
		data.save()

	return 



def is_within_shift_time(check_time):
	# Get today's date in the timezone of check_time
	print("check_time :",check_time)

	if not isinstance(check_time, datetime):
		# Ensure that check_time is a datetime object
		raise ValueError("check_time must be a datetime object")
	today = timezone.now().date()

	# Calculate datetime objects for 8 AM and 8 PM of the previous day
	previous_day_8am = timezone.make_aware(datetime.combine(today - timedelta(days=1), datetime.min.time()) + timedelta(hours=8))
	previous_day_8pm = timezone.make_aware(datetime.combine(today - timedelta(days=1), datetime.min.time()) + timedelta(hours=20))

	# Calculate datetime objects for 8 AM and 8 PM of today
	today_8am = timezone.make_aware(datetime.combine(today, datetime.min.time()) + timedelta(hours=8))
	today_8pm = timezone.make_aware(datetime.combine(today, datetime.min.time()) + timedelta(hours=20))

	# Check if the check_time is within the specified range
	return previous_day_8am <= check_time < previous_day_8pm or today_8am <= check_time < today_8pm







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



