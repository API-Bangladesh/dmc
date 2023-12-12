from datetime import datetime
from django.shortcuts import render
import pytz
from rest_framework.response import Response
from .models import SyncInfoTable
from django.utils import timezone
# Create your views here.
def syncInfo(gmt6_datetime,employee_id):
    print("employee_id :",employee_id,"sync time :",gmt6_datetime)
    # timezone = pytz.timezone('Asia/Dhaka')
    # current_datetime = datetime.now(timezone)
    # print("current time :",current_datetime)
    current_timestamp = datetime.timestamp(datetime.now())

    utc_datetime = datetime.utcfromtimestamp(current_timestamp)


    # Specify the UTC timezone
    utc_timezone = pytz.timezone('UTC')
    utc_datetime = utc_timezone.localize(utc_datetime)

    # Convert to the desired timezone (GMT+6)
    gmt6_timezone = pytz.timezone('Asia/Dhaka')  # Replace with the appropriate timezone identifier
    gmt6_datetime = utc_datetime.astimezone(gmt6_timezone)

    data=SyncInfoTable(syncTime=gmt6_datetime.replace(tzinfo=timezone.utc),employee_id=employee_id)
    data.save()

    return Response({"message":"successfully synced"})
