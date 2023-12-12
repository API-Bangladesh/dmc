from datetime import datetime, timezone
from pydoc import stripid
from django.shortcuts import render
from django.conf import settings
from rest_framework.response import Response
from .serializers import EmployeeSerializer
from .models import Employee
from rest_framework import status
from django.core.files.storage import default_storage
from django.core.files.base import ContentFile
import requests
import json
import base64
import os
from pathlib import Path
from device.models import Device
from . import models
from grpdev.models import GroupDevice
from requests.auth import HTTPDigestAuth
from django.contrib.auth.hashers import make_password
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from django.utils import timezone
import re
from urllib.parse import unquote
from PIL import Image
from rest_framework.pagination import PageNumberPagination
# Create your views here.

@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def employee(request):
	if request.method == 'GET':

		tasks = Employee.objects.all().order_by('-employee_id')
		serializer = EmployeeSerializer(tasks, many=True)
		unique_field = int(timezone.now().timestamp() * 1000)  # Using milliseconds
		print("unique_field :",unique_field)
		# Apply pagination
		paginator = PageNumberPagination()
		# paginator.page_size = 10  # Set the number of items per page
		paginator.page_size = int(request.GET.get('page_size', 10))

		result_page = paginator.paginate_queryset(tasks, request)

		serializer = EmployeeSerializer(result_page, many=True)

		return paginator.get_paginated_response(serializer.data)


		# return Response(serializer.data)
	if request.method == 'POST' and request.data["group_id"]!=None:
		print("Request Data:", request.data)
		serializer = EmployeeSerializer(data=request.data)

		if serializer.is_valid():

			serializer.save()


			employee = Employee.objects.get(employee_id=request.data['employee_id'])
			print("got employee ",employee)
			print("before hashing : ",employee.password)

			employee.password = make_password(employee.password)
			print("hashed password : ",employee.password)
			employee.save()
			# Set the hashed password for the specific Employee instance
			print("Saved Data:", serializer.data)
			all_data=serializer.data
			after_serialize=EmployeeSerializer(employee)

			##this portion should be uncomment during employee adding into the device			

			if all_data["group_id"] != None and all_data["image"]==None:
				train_employee(all_data)
			elif all_data["group_id"] != None and all_data["image"]!=None:
				train_employee_with_image(all_data)


			return Response(after_serialize.data, status=status.HTTP_201_CREATED)
		else:
			print("Errors:", serializer.errors)
			return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
	else:
		return Response({"message":"Group id must be given"}, status=status.HTTP_400_BAD_REQUEST)

	# if request.method == 'POST' and request.FILES['image']:
	# 	image_file = request.FILES['image']
	# 	print('Image File :',image_file)
	# 	file_path = default_storage.save('images/' + image_file.name, ContentFile(image_file.read()))
	# 	user = Employee.objects.create(username=request.data['username'], image=file_path)
	# 	return Response({'message': 'Image uploaded successfully.'})


@api_view(['GET','POST','DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def employee_with_id(request,pk):
	task = Employee.objects.filter(employee_id=pk).first()
	checker = EmployeeSerializer(task, many=False)
	checker_data=checker.data


	print("task : ",task)
	if task!=None:
		if request.method == 'GET' :
			serializer = EmployeeSerializer(task, many=False)
			# hashed=make_password("1234") 
			# # if hashed == serializer.data["password"]:
			# print("hashed :",hashed,"password is : 1234")
					# Input string

			timestamp_str = serializer.data["UniqueCardNumber"]

			# Convert string to datetime object
			timestamp_dt = datetime.strptime(timestamp_str, "%Y-%m-%dT%H:%M:%SZ")

			# Convert datetime object to timestamp (seconds since the epoch)
			timestamp_seconds = timestamp_dt.timestamp()
			timestamp_milliseconds = int(timestamp_seconds * 1000)
			print(timestamp_milliseconds)
			print("timestamp_mili seconds : ",timestamp_milliseconds)
			# get_employee_data(serializer.data)


			# serializer.data["UniqueCardNumber"]=int(timestamp_milliseconds)
			# print("miliseconds data : ",serializer.data["UniqueCardNumber"])

			return Response(serializer.data)

		if request.method == 'POST' :

			serializer = EmployeeSerializer(instance=task, data=request.data)
			
			# sdata=serializer.data
			### This portion will uncomment during actual employee train and testing
			if serializer.is_valid():
				serializer.save()
				if serializer.data["group_id"] != None and checker_data['group_id'] == None:
						train_employee(serializer.data)
				else:
					try:
						if serializer.data["image"] != None and checker_data['image'] == None:
							add_image(serializer.data)
						else:
							update_data(serializer.data)
					except Exception as e:
						return Response(e)

			# else:
			# 	return Response(serializer.errors)
			
			# if serializer.is_valid():
				
				
				employee = Employee.objects.get(employee_id=pk)
				print("got employee ",employee)
				print("before hashing : ",employee.password)

				employee.password = make_password(employee.password)
				print("hashed password : ",employee.password)
				employee.save()
				
				after_serialize=EmployeeSerializer(instance=employee,many=False)

				# if after_serialize.is_valid():
				# 	after_serialize.save()

				return Response(after_serialize.data)
			else:
				return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)
		elif request.method == 'DELETE' :
				### This portion will uncomment during actual employee train and testing
				try:
					delete_info(pk)
					task.delete()
					return Response({"message":"employee successfully deleted!"})
				except Exception as e:
					print("excedption :",e)
					return Response({"message":e})
	else:
		return Response({"message":"Employee id is not valid"})

def add_image(data):
	print("E_ID :",data['employee_id'])
	print("Name :",data["username"])
	print("Surname",data["username"].replace(" ","_"))
	# image_path = os.path.join(settings.MEDIA_ROOT, str(employee.employee_id), "image.jpg")
	img=data["image"].replace("/media","")
	# img=img.replace("/","\\")
	# image_path = os.path.join(settings.MEDIA_ROOT,data['employee_id'],data["username"]+".jpg")
	img = img.lstrip('/')
	image_path = Path(settings.MEDIA_ROOT) / img
	print("img :",img)
	print("media root :",settings.MEDIA_ROOT)
	print("image path :",image_path)
	print("register date : ",data["registration_date"])
	print("validity_date :",data["validity_date"])
	# DeviceLocalIP=GroupDevice.objects.get(group_id = data["group_id"])
	devices= GroupDevice.objects.filter(group_id=data["group_id"]).values_list('device_id', flat=True)
	i=0
	for dev in devices:
		print("i=",i)
		i=i+1
		print("dev :",dev)
		DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)
		
		ip=DeviceLocalIP[0]
		print("ip : ",ip)

		###Add user info into dahua device
		reg_date=data["registration_date"]
		reg_date=reg_date.replace("-","")
		valid_date=data["validity_date"]
		valid_date=valid_date.replace("-","")
		###Dahua image add API

		resize_image(image_path,image_path,80)
		with open(image_path,"rb") as image:
			im=image.read()
			# print("img :",im)
			base64_img=base64.b64encode(im)
			# print("image base64 : ",base64_img.decode("utf-8"))
			add_image_url=f"http://{ip}/cgi-bin/FaceInfoManager.cgi?action=add"
			data={
				"UserID":data["employee_id"],
				"Info":{
					"UserName":data["username"],
					"PhotoData":[base64_img.decode("utf-8")]
				}

			}
			response = requests.post(add_image_url,json=data,auth=HTTPDigestAuth('admin','admin123'),headers={"Content-Type":"application/json"})
			print("response add image:",response.text)

	return 

		
def get_employee_data(data):
		devices= GroupDevice.objects.filter(group_id=data["group_id"]).values_list('device_id', flat=True)
		for dev in devices:
			DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)
			url=f"http://{DeviceLocalIP[0]}/cgi-bin/recordFinder.cgi?action=find&name=AccessControlCard&condition.UserID={data['employee_id']}&count=100"
			resp=requests.get(url,auth=HTTPDigestAuth('admin','admin123'))
			print("response :",resp.text)
			data=resp.text.split('\n')
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
			print("records :",records)
			with open("people.txt","w") as file:
				file.write(str(resp.text))
			# log_records=[]
			# log_records.append(current_record)

			for index in range(len(records)):
				print("---for index---- : ",index)
				# print("AttendanceState : ",records[index]['AttendanceState'])
				print("CardName : ",records[index]['CardName'])
				print("CardNo : ",records[index]['CardNo'])

				print("Password: ",records[index]['Password'])
				print("RecNo : ",records[index]['RecNo'])
				print("UserID : ",records[index]['UserID'])

				return records[index]['RecNo']
			

def train_employee(data):
	print("E_ID :",data['employee_id'])
	print("Name :",data["username"])
	print("Surname",data["username"].replace(" ","_"))

	print("register date : ",data["registration_date"])
	print("validity_date :",data["validity_date"])
	# DeviceLocalIP=GroupDevice.objects.get(group_id = data["group_id"])
	devices= GroupDevice.objects.filter(group_id=data["group_id"]).values_list('device_id', flat=True)
	i=0
	for dev in devices:
		print("i=",i)
		i=i+1
		print("dev :",dev)
		DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)
		# for ip in DeviceLocalIP:
		

		ip=DeviceLocalIP[0]
		print("ip : ",ip)

		###Add user info into dahua device
		reg_date=data["registration_date"]
		reg_date=reg_date.replace("-","")
		valid_date=data["validity_date"]
		valid_date=valid_date.replace("-","")

		employee_add_info_url=f'http://{ip}/cgi-bin/recordUpdater.cgi?action=insert&name=AccessControlCard&CardName={data["username"]}&CardNo={data["cardNo"]}&UserID={data["employee_id"]}&CardStatus=0&CardType=0&Password={data["password"]}&Doors[0]=0&VTOPosition=01018001&ValidDateStart={reg_date}%20093811&ValidDateEnd={valid_date}%20093811'
		response=requests.get(employee_add_info_url,auth=HTTPDigestAuth('admin','admin123'))
		print("response create employee:",response)




def train_employee_with_image(data):
	print("E_ID :",data['employee_id'])
	print("Name :",data["username"])
	print("Surname",data["username"].replace(" ","_"))
	# image_path = os.path.join(settings.MEDIA_ROOT, str(employee.employee_id), "image.jpg")
	img=data["image"].replace("/media","")
	# img=img.replace("/","\\")
	# image_path = os.path.join(settings.MEDIA_ROOT,data['employee_id'],data["username"]+".jpg")
	img = img.lstrip('/')
	image_path = Path(settings.MEDIA_ROOT) / img
	print("img :",img)
	print("media root :",settings.MEDIA_ROOT)
	print("image path :",image_path)
	print("register date : ",data["registration_date"])
	print("validity_date :",data["validity_date"])
	# DeviceLocalIP=GroupDevice.objects.get(group_id = data["group_id"])
	devices= GroupDevice.objects.filter(group_id=data["group_id"]).values_list('device_id', flat=True)
	i=0
	for dev in devices:
		print("i=",i)
		i=i+1
		print("dev :",dev)
		DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)
		
		ip=DeviceLocalIP[0]
		print("ip : ",ip)

		###Add user info into dahua device
		reg_date=data["registration_date"]
		reg_date=reg_date.replace("-","")
		valid_date=data["validity_date"]
		valid_date=valid_date.replace("-","")
		cardno=int(data["cardNo"])
		employee_add_info_url=f'http://{ip}/cgi-bin/recordUpdater.cgi?action=insert&name=AccessControlCard&CardName={data["username"]}&CardNo={cardno}&UserID={data["employee_id"]}&CardStatus=0&CardType=0&Password={data["password"]}&Doors[{0}]=0&VTOPosition=01018001&ValidDateStart={reg_date}%20093811&ValidDateEnd={valid_date}%20093811'
		response=requests.get(employee_add_info_url,auth=HTTPDigestAuth('admin','admin123'))
		print("response create employee:",response.url)


		###Dahua image add API

		resize_image(image_path,image_path,80)
		with open(image_path,"rb") as image:
			im=image.read()
			# print("img :",im)
			base64_img=base64.b64encode(im)
			# print("image base64 : ",base64_img.decode("utf-8"))
			add_image_url=f"http://{ip}/cgi-bin/FaceInfoManager.cgi?action=add"
			data={
				"UserID":data["employee_id"],
				"Info":{
					"UserName":data["username"],
					"PhotoData":[base64_img.decode("utf-8")]
				}

			}
			response = requests.post(add_image_url,json=data,auth=HTTPDigestAuth('admin','admin123'),headers={"Content-Type":"application/json"})
			print("response add image:",response.text)



def update_data(data):
	devices= GroupDevice.objects.filter(group_id=data["group_id"]).values_list('device_id', flat=True)
	i=0
	for dev in devices:
		print("i=",i)
		i=i+1
		print("dev :",dev)
		DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)
		EmployeeName = data["username"]
		
		EmployeeID = data["employee_id"]
		Password=data["password"] 

		print("DeviceLocalIP :",DeviceLocalIP[0])
		print("EmployeeName : ",EmployeeName)
		print("EmployeeID : ",EmployeeID)
		print("Password : ",Password)

		RecordNumberFrom_Find_Employee_Info=int(get_record_number(DeviceLocalIP[0],EmployeeID))
		print("ip :",DeviceLocalIP[0])


		door = '&Doors[0]=0'
		door_decoded = unquote(door)
		update_info=f"http://{DeviceLocalIP[0]}/cgi-bin/recordUpdater.cgi?action=update&name=AccessControlCard&recno={RecordNumberFrom_Find_Employee_Info}&CardName={EmployeeName}&CardNo={data['cardNo']}&UserID={EmployeeID}&CardStatus=0&CardType=0&Password={Password}&Doors[{0}]=0"
		
		response = requests.get(update_info,auth=HTTPDigestAuth('admin','admin123'))
		print("update_info_url :  ",response.url)

		print("response update info: ",response.text)

def get_record_number(ip,employee_id):
		find_employee_info_url=f"http://{ip}/cgi-bin/recordFinder.cgi?action=find&name=AccessControlCard&condition.UserID={employee_id}&count={8000}"
		resp=requests.get(find_employee_info_url,auth=HTTPDigestAuth('admin','admin123'))
		print("find user url : ",resp.url)
		print("response :",resp.text)
		### RecordNumberFrom_Find_Employee_Info should be retrieve from 'resp.text'
		# url=f"http://{DeviceLocalIP[0]}/cgi-bin/recordFinder.cgi?action=find&name=AccessControlCard&condition.UserID={data['employee_id']}&count=100"
		# resp=requests.get(url,auth=HTTPDigestAuth('admin','admin123'))
		# print("response :",resp.text)

		data_1=resp.text.split('\n')
		records = []

		# Split the text into lines
		lines = data_1

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
		print("cardNo :",records[0]["CardNo"])
		print("RecNo :",records[0]["RecNo"])
		return records[0]["RecNo"]
		

def delete_info(e_id):
	info=Employee.objects.get(employee_id=e_id)
	serializer = EmployeeSerializer(info, many=False)
	data=serializer.data
	devices=GroupDevice.objects.filter(group_id=data["group_id"]).values_list("device_id",flat=True)
	for dev in devices:
		print("dev : ",dev)

		DeviceLocalIP=Device.objects.filter(device_id =dev).values_list("device_ip",flat=True)


		find_employee_info_url=f"http://{DeviceLocalIP[0]}/cgi-bin/recordFinder.cgi?action=find&name=AccessControlCard&condition.UserID={data['employee_id']}&count={8000}"
		resp=requests.get(find_employee_info_url,auth=HTTPDigestAuth('admin','admin123'))
		print("response :",resp.text)
		### RecordNumberFrom_Find_Employee_Info should be retrieve from 'resp.text'
		RecordNumberFrom_Find_Employee_Info=int(get_record_number(DeviceLocalIP[0],data['employee_id'])) #for testing ,suppose RecordNumberFrom_Find_Employee_Info=45

		employee_delete_url=f"http://{DeviceLocalIP[0]}/cgi-bin/recordUpdater.cgi?action=remove&name=AccessControlCard&recno={RecordNumberFrom_Find_Employee_Info}"
		response= requests.get(employee_delete_url,auth=HTTPDigestAuth('admin','admin123'))
		print("response : ",response.text)



def resize_image(input_path,output_path,max_size_kb):
    with Image.open(input_path) as img:
        original_size = os.path.getsize(input_path)
        original_width, original_height = img.size
        target_size_bytes = max_size_kb * 1024
        scale_factor = 1.0
        if original_size > target_size_bytes:
            scale_factor = (target_size_bytes / original_size) ** 0.5

        new_width = int(original_width * scale_factor)
        new_height = int(original_height * scale_factor)
        resized_img = img.resize((new_width, new_height), Image.LANCZOS)
        resized_img.thumbnail((230, 230)) 
        resized_img.save(output_path, optimize=True, quality=100)
        print("compressing ...")


def pagination():
			if "&" in id:
				flag=1
				print("id :",id)
				pageNo=id.split('&')[0]
				dataNo=id.split('&')[1]
				print("pageNo :",pageNo,"dataNo :",dataNo)
				pageCount=pageNo.split('=')[1]
				dataCount=dataNo.split('=')[1]
				print("pageCount :",pageCount,"dataCount :",dataCount)
				print("data from :",(int(pageCount)-1)*int(dataCount),"data to ",int(pageCount)*int(dataCount))
			
			rangeBegin=(int(pageCount)-1)*int(dataCount)
			rangeEnd=int(pageCount)*int(dataCount)