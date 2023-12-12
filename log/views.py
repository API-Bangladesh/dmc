from datetime import datetime, timedelta
from django.utils import timezone

import json
from urllib.request import HTTPDigestAuthHandler
import pytz
from requests.auth import HTTPDigestAuth
from django.shortcuts import render

# Create your views here.
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
import requests
from attendance_report.views import insert_attendance_log
from syncInfo.views import syncInfo

from employee.models import Employee
from .serializers import LogSerializer
from rest_framework.decorators import api_view, authentication_classes, permission_classes
import re
from .models import Log
from device.models import Device
from device.serializers import DeviceSerializer
import ipaddress
from structuedlog.views import insert_structed_log
from login.models import LogInLog

@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def log(request):
    # response = requests.post(add_image_url,json=data,auth=HTTPDigestAuth('admin','admin123'),headers={"Content-Type":"application/json"})

    if request.method=="POST":
         
        logintoken=request.headers['Authorization']
        logintoken=logintoken.replace("Bearer ","")
        employee_id_found=LogInLog.objects.filter(token=str(logintoken)).values_list("employee_id",flat=True)
        print("login token :",logintoken)
        print("loged in employee :",employee_id_found[0])
        

        
        start=request.data["start"]
        end=request.data["end"]
        # device=Device.objects.none()


        ###ip based seraching

        # DeviceLocalIP=Device.objects.all().values_list("device_ip","active_status",flat=False)
        # print("device ip:",DeviceLocalIP[0])
        # log=[]
        # if 'ip' in request.data:

        #     ip = request.data["ip"]
        #     print("ip :",ip," start : ",start,"end : ",end)
        #     for dip in DeviceLocalIP:
        #           if dip[0]==ip and dip[1]=="active":

        #             logs=get_data_by_ip(str(dip[0]),start,end)
        #             log.append({ip:logs})
        # else:
        #      for ip in DeviceLocalIP:
        #           if ip[1]=="active":
        #             logs=get_data_by_ip(ip[0],start,end)
        #             log.append({ip[0]:logs})
        # print("log :",log)
        # return Response({"log":log})
    ###id based searching
        device_id=Device.objects.all().values_list("device_id","active_status",flat=False)
        print("device ip:",device_id[0])
        log=[]
        if 'device_id' in request.data:

            id = request.data["device_id"]
            print("device_id :",id," start : ",start,"end : ",end)
            for did in device_id:
                  if did[0]==id and did[1]=="active":

                    logs=get_data_by_ip(str(did[0]),start,end)
                    log.append({id:True})
        else:
             for id in device_id:
                  if id[1]=="active":
                    logs=get_data_by_ip(id[0],start,end)
                    log.append({id[0]:True})
        # print("log :",log)
        loged_employee=Employee.objects.get(employee_id=employee_id_found[0])
        timezone = pytz.timezone('Asia/Dhaka')
        current_datetime = datetime.now(timezone)
        gmt6_datetime = current_datetime.astimezone(timezone)
        print(current_datetime)

        syncInfo(current_datetime,loged_employee)

        return Response({"Sync Status":log})






# @api_view(['GET','DELETE'])
# @authentication_classes([JWTAuthentication])
# @permission_classes([IsAuthenticated])
# def log_with_id(request,pk):
#     return

def get_data_by_ip(did,start,end):
            print("inside the get log function")
            ip=Device.objects.filter(device_id=did).values_list("device_ip",flat=True)
            
            url=f"http://{ip[0]}/cgi-bin/recordFinder.cgi?action=find&name=AccessControlCardRec&StartTime={int(start)}&EndTime={int(end)}&count=1000"
            response=requests.get(url,auth=HTTPDigestAuth('admin','admin123'))
            print("response url :",response.url)
            data=response.text.split('\n')
            # print("data :",data)
            records = []

            # Split the text into lines
            lines = data

            # Remove empty lines
            lines = [line for line in lines if line.strip()]

            current_index = None
            current_record = {}

            for line in lines:
                # Extract the index, field, and value using regular expressions
                match = re.match(r'records\[(\d+)\]\.(.*?)=(.*)', line)
                if match:
                    index = int(match.group(1))
                    field_name = match.group(2)
                    value = match.group(3)

                    if index != current_index:
                        if current_record:
                            records.append(current_record)
                        current_index = index
                        current_record = {}

                    current_record[field_name] = value

            if current_record:
                records.append(current_record)
            # print("records :",records)

            datas=[]
            for index in range(len(records)):
                
                # print("---for index---- : ",index)
                # print("AttendanceState : ",records[index]['AttendanceState'])
                # print("CardName : ",records[index]['CardName'])

                # print("CardNo : ",records[index]['CardNo'])
                # print("CardType : ",records[index]['CardType'])
                # print("CreateTime : ",records[index]['CreateTime'])

                # print("Door : ",records[index]['Door'])
                # print("ErrorCode : ",records[index]['ErrorCode'])
                # print("FaceIndex : ",records[index]['FaceIndex'])
                # print("HatColor : ",records[index]['HatColor'])
                # print("HatType : ",records[index]['HatType'])
                
                # print("Mask : ",records[index]['Mask'])
                # print("Method : ",records[index]['Method'])
                # print("Notes : ",records[index]['Notes'])
                # print("Password: ",records[index]['Password'])
                # print("ReaderID : ",records[index]['ReaderID'])

                # print("RecNo : ",records[index]['RecNo'])


                # print("RemainingTimes : ",records[index]['RemainingTimes'])
                # print("ReservedInt: ",records[index]['ReservedInt'])
                # print("ReservedString : ",records[index]['ReservedString'])
                # print("RoomNumber : ",records[index]['RoomNumber'])

                # print("Status: ",records[index]['Status'])
                # print("Type : ",records[index]['Type'])
                # print("url : http://192.168.68.135/RPC2_Loadfile",records[index]['URL'],"?timestamp="+records[index]['CreateTime'])

                # img_url= "http://192.168.68.135/RPC2_Loadfile"+records[index]['URL']+"?timestamp="+records[index]['CreateTime']
                # print("URL IS :",img_url)
                # print("UserID : ",records[index]['UserID'])
                # print("UserType : ",records[index]['UserType'])
                CardName=records[index]['CardName']
                InTime=records[index]['CreateTime']
                RecNo=records[index]['RecNo']
                RoomNumber=records[index]['RoomNumber']
                Status=records[index]['Status']
                Type=records[index]['Type']
                image_url=records[index]['URL']
                employee_id = records[index]['UserID']
                devi=Device.objects.get(device_id=did)
               # employee=Employee.objects.get(employee_id=employee_id)
                # intime=datetime.utcfromtimestamp(int(InTime.rstrip('\r')))
                utc_datetime = datetime.utcfromtimestamp(int(InTime.rstrip('\r')))


                # Specify the UTC timezone
                utc_timezone = pytz.timezone('UTC')
                utc_datetime = utc_timezone.localize(utc_datetime)

                # Convert to the desired timezone (GMT+6)
                gmt6_timezone = pytz.timezone('Asia/Dhaka')  # Replace with the appropriate timezone identifier
                gmt6_datetime = utc_datetime.astimezone(gmt6_timezone)
                
                if employee_id !='\r':
                    exist=employee=Employee.objects.filter(employee_id=str(employee_id.rstrip('\r'))).first()
                    if exist!=None:
                        employee=Employee.objects.get(employee_id=str(employee_id.rstrip('\r')))
                        # device_id=Device.objects.filter(device_ip=ip).values_list("device_id",flat=True)
                        info={
                            "device_id":did,
                            "CardName":CardName.rstrip('\r'),
                            "InTime":gmt6_datetime,
                            "RecNo":int(RecNo.rstrip('\r')),
                            "RoomNumber":RoomNumber.rstrip('\r'),
                            "Status":int(Status.rstrip('\r')),
                            "Type":Type.rstrip('\r'),
                            "image_url":image_url.rstrip('\r'),
                            "employee_id":employee_id.rstrip('\r')

                            }
                        check_record_number=Log.objects.filter(RecNo=int(RecNo.rstrip('\r'))).values_list("RecNo",flat=False)
                        print("record number :",check_record_number.count())
                        if check_record_number.count()==0:
                            # gmt6_timezone = pytz.timezone("GMT+6")
                            # in_time_gmt6 = datetime(2023, 11, 26, 11, 41, 20, tzinfo=gmt6_timezone)
                            print("log InTime :",gmt6_datetime.replace(tzinfo=timezone.utc))
                            ins=Log(
                                device_id=devi,
                                CardName=CardName.rstrip('\r'),
                                InTime=gmt6_datetime.replace(tzinfo=timezone.utc),
                                RecNo=int(RecNo.rstrip('\r')),
                                RoomNumber=RoomNumber.rstrip('\r'),
                                Status=int(Status.rstrip('\r')),
                                Type=Type.rstrip('\r'),
                                image_url=image_url.rstrip('\r'),
                                employee_id=employee
                                )
                            
                            ins.save()
                            print("saved")
                            insert_structed_log(device_id=devi,employee_id=employee,username=CardName,InTime=gmt6_datetime.replace(tzinfo=timezone.utc))
                            insert_attendance_log(device_id=devi,employee_id=employee,username=CardName,InTime=gmt6_datetime.replace(tzinfo=timezone.utc))
        
                        else:
                            # insert_attendance_log(device_id=devi,employee_id=employee,username=CardName,InTime=gmt6_datetime.replace(tzinfo=timezone.utc))

                            # insert_structed_log(device_id=devi,employee_id=employee,username=CardName,InTime=gmt6_datetime.replace(tzinfo=timezone.utc))

                            print("data already synced")
                        datas.append(info)

            return datas

def auto_save():
    device=Device.objects.all().order_by('-device_id')
    serializer=DeviceSerializer(device,many=True)
    for d in serializer.data:
        timezone = pytz.timezone('Asia/Dhaka')  # Replace 'Asia/Dhaka' with the desired timezone

        # Get the current time in the specified timezone
        current_time = datetime.now(timezone)

        # Calculate the start time by subtracting 5 minutes
        start_time = current_time - timedelta(minutes=180)
        
        start=int(start_time.timestamp())
        end=int(current_time.timestamp())
        if d["active_status"]=="active":
            print("device id :",d["device_id"])
            get_data_by_ip(d["device_id"],start,end)


