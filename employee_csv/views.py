# myapp/views.py
from rest_framework.decorators import api_view,authentication_classes,permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
from rest_framework.response import Response
from rest_framework import status
import csv
import zipfile
from io import BytesIO
from django.core.files.uploadedfile import InMemoryUploadedFile
from django.contrib.auth.hashers import make_password
from django.utils import timezone
from datetime import datetime
from .models import Employee
from employee.serializers import EmployeeSerializer

@api_view(['POST'])
@authentication_classes(JWTAuthentication)
@permission_classes(IsAuthenticated)
def file_upload_view(request, format=None):
    if request.method == 'POST':
        # Parse CSV file
        csv_file = request.FILES['csv_file']
        csv_data = csv.reader(csv_file.read().decode('utf-8').splitlines())

        # Extract ZIP file
        zip_file = request.FILES['zip_file']
        with zipfile.ZipFile(zip_file, 'r') as z:
            for employee_data in csv_data:
                employee_id = employee_data[0]
                image_filename = f'{employee_id}.jpg'

                # Check if image file exists in the ZIP
                if image_filename in z.namelist():
                    image_data = z.read(image_filename)

                    # Create or update Employee
                    employee, created = Employee.objects.update_or_create(
                        employee_id=employee_id,
                        defaults={
                            'username': employee_data[1],
                            'first_name': employee_data[2],
                            'last_name': employee_data[3],
                            'email': employee_data[4],
                            'password': make_password(employee_data[5]),
                            'phone_number': employee_data[6],
                            'image_location': employee_data[7],
                            'shift_id': employee_data[8],  # Make sure to handle this foreign key appropriately
                            'registration_date': datetime.strptime(employee_data[9], '%Y-%m-%d').date(),
                            'validity_date': employee_data[10],
                            'employee_type': employee_data[11],
                            'group_id': employee_data[12],  # Make sure to handle this foreign key appropriately
                            'image': InMemoryUploadedFile(
                                BytesIO(image_data),
                                None,
                                image_filename,
                                'image/jpeg',
                                len(image_data),
                                None
                            ),
                            'UniqueCardNumber': datetime(2023, 1, 1, tzinfo=timezone.utc),
                            'cardNo': employee_data[13],
                            'department': employee_data[14],  # Make sure to handle this foreign key appropriately
                            'designation': employee_data[15],  # Make sure to handle this foreign key appropriately
                        }
                    )

        return Response({'message': 'Upload successful'}, status=status.HTTP_201_CREATED)

    return Response({'message': 'Invalid request'}, status=status.HTTP_400_BAD_REQUEST)
