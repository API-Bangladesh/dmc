from datetime import datetime, timedelta
from django.utils import timezone
from django.shortcuts import render
import pytz
from grpdev.models import GroupDevice
from structuedlog.models import StructuredLog
from structuedlog.serializers import StructuredLogSerializer
from empgrp.models import Group
from employee.models import Employee
# Create your views here.
def insert_structed_log(device_id,employee_id,username,InTime):
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
        # utc_datetime = datetime.utcfromtimestamp(int(InTime.rstrip('\r')))

        # utc_datetime = datetime.utcfromtimestamp(int(InTime.rstrip('\r')))


        # # Specify the UTC timezone
        # utc_timezone = pytz.timezone('UTC')
        # utc_datetime = utc_timezone.localize(utc_datetime)

        # # Convert to the desired timezone (GMT+6)
        # gmt6_timezone = pytz.timezone('Asia/Dhaka')  # Replace with the appropriate timezone identifier
        # gmt6_datetime = utc_datetime.astimezone(gmt6_timezone)
        # print("log time 2 :",gmt6_datetime)

        data = StructuredLog(
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
