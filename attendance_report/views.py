from datetime import datetime, timedelta
from django.utils import timezone
from django.shortcuts import render
import pytz
from grpdev.models import GroupDevice
from structuedlog.models import StructuredLog
from structuedlog.serializers import StructuredLogSerializer
from empgrp.models import Group
from employee.models import Employee
from .models import AttendanceReport

from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import AttendanceSerializer
from .models import AttendanceReport
from rest_framework import status
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.pagination import PageNumberPagination


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
	if request.method == 'GET':
		tasks = AttendanceReport.objects.all().order_by('-ID')
		# serializer = AttendanceSerializer(tasks, many=True)
		paginator = PageNumberPagination()
		# paginator.page_size = 10  # Set the number of items per page
		paginator.page_size = int(request.GET.get('page_size', 10))

		result_page = paginator.paginate_queryset(tasks, request)

		serializer = AttendanceSerializer(result_page, many=True)

		return paginator.get_paginated_response(serializer.data)
		# return Response(serializer.data)
	if request.method == 'POST':
		print("Request Data:", request.data)
		serializer = AttendanceSerializer(data=request.data)
		if serializer.is_valid():
			serializer.save()
			print("Saved Data:", serializer.data)
			return Response(serializer.data, status=status.HTTP_201_CREATED)
		else:
			print("Errors:", serializer.errors)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)



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
				task.delete()
				return Response({"message":"Log successfully deleted!"})
		
	else:
		return Response({"message":"Log id is not valid"})
	


