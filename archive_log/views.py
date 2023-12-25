import csv
import datetime
import os
from django.shortcuts import render
from attendance_report.models import AttendanceReport

from dmc.settings import MEDIA_DIR
from rest_framework.decorators import api_view,authentication_classes,permission_classes
from rest_framework.permissions import IsAuthenticated
from rest_framework_simplejwt.authentication import JWTAuthentication

from log.models import Log
from structuedlog.models import StructuredLog

# Create your views here.
@api_view(['DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes(IsAuthenticated)

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


	six_months_ago = datetime.now() - datetime.timedelta(days=6 * 30)

	# Filter logs older than 6 months
	logs_to_delete = AttendanceReport.objects.filter(timestamp__lt=six_months_ago)

	# Export to CSV
	csv_filename = f'old_attendance_logs_till_{datetime.now()}_backup.csv'
	with open(csv_filename, 'w', newline='') as csvfile:
		fieldnames = ['ID', 'username', 'InTime','OutTime','total_work_minutes','cumalative_work_minutes','device_id','group_id','employee_id']  # Replace with actual field names
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

		# Write CSV header
		writer.writeheader()

		# Write log data to CSV
		for log in logs_to_delete:
			writer.writerow({'ID':log.ID, 'username':log.username, 'InTime':log.InTime,'OutTime':log.OutTime,'total_work_minutes':log.total_work_minutes,'cumalative_work_minutes':log.cumalative_work_minutes,'device_id':log.device_id,'group_id':log.group_id,'employee_id':log.employee_id})  # Replace with actual field values

	# Delete logs
	logs_to_delete.delete()
	path=str(MEDIA_DIR)+f'/{csv_filename}'
	# Optionally, move the CSV file to a desired location
	print("path :",path)
	os.rename(csv_filename, path)
       
### raw_log delete
	##delete attendance log
        # {
        #     "r_clsf_record_id": 238,
        #     "CardName": "tanim_Test",
        #     "InTime": "2023-12-25T00:46:04+06:00",
        #     "RecNo": 238,
        #     "RoomNumber": "",
        #     "Status": 1,
        #     "Type": "Entry",
        #     "image_url": "/SnapShotFilePath/2023-12-24/20/46/DMC653_99_100_20231224204604792.jpg",
        #     "device_id": "DmcGate10",
        #     "employee_id": "DMC653"
        # }



	# Filter logs older than 6 months
	rlogs_to_delete = Log.objects.filter(timestamp__lt=six_months_ago)

	# Export to CSV
	rcsv_filename = f'old_raw_logs_till_{datetime.now()}_backup.csv'
	with open(rcsv_filename, 'w', newline='') as csvfile:
		fieldnames = ['r_clsf_record_id', 'CardName', 'InTime','RecNo','RoomNumber','Status','Type','image_url','device_id','employee_id']  # Replace with actual field names
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

		# Write CSV header
		writer.writeheader()

		# Write log data to CSV
		for log in rlogs_to_delete:
			writer.writerow({'r_clsf_record_id':log.r_clsf_record_id, 'CardName':log.CardName, 'InTime':log.InTime,'RecNo':log.RecNo,'RoomNumber':log.RoomNumber,'Status':log.Status,'Type':log.Type,'image_url':log.image_url,'device_id':log.device_id,'employee_id':log.employee_id})  # Replace with actual field values

	# Delete logs
	rlogs_to_delete.delete()
	path=str(MEDIA_DIR)+f'/{rcsv_filename}'
	# Optionally, move the CSV file to a desired location
	print("path :",path)
	os.rename(rcsv_filename, path)	

### structured_log delete
	##delete attendance log
        # {
        #     "ID": 238,
        #     "username": "tanim_Test",
        #     "InTime": "2023-12-25T00:46:04+06:00",
        #     "device_id": "DmcGate10",
        #     "group_id": 2,
        #     "employee_id": "DMC653"
        # }



	# Filter logs older than 6 months
	slogs_to_delete = StructuredLog.objects.filter(timestamp__lt=six_months_ago)

	# Export to CSV
	scsv_filename = f'old_raw_logs_till_{datetime.now()}_backup.csv'
	with open(scsv_filename, 'w', newline='') as csvfile:
		fieldnames = ['ID', 'username', 'InTime','device_id','group_id','employee_id']  # Replace with actual field names
		writer = csv.DictWriter(csvfile, fieldnames=fieldnames)

		# Write CSV header
		writer.writeheader()

		# Write log data to CSV
		for log in slogs_to_delete:
			writer.writerow({'ID':log.ID, 'username':log.username, 'InTime':log.InTime,'device_id':log.device_id,'group_id':log.group_id,'employee_id':log.employee_id})  # Replace with actual field values

	# Delete logs
	slogs_to_delete.delete()
	path=str(MEDIA_DIR)+f'/{rcsv_filename}'
	# Optionally, move the CSV file to a desired location
	print("path :",path)
	os.rename(scsv_filename, path)