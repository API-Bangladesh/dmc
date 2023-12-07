import base64
from datetime import datetime, timedelta
import secrets
import pytz
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .models import ForgetPassword
from employee.models import Employee
from .serializers import ForgetPasswordSerializer
from employee.serializers import EmployeeSerializer
from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone


@api_view(['POST'])
def email_sending(request):
    if 'email' in request.data:
        find=Employee.objects.filter(email=request.data["email"]).first()
        if find !=None:
            employee=Employee.objects.get(email=request.data["email"])
            random_string = secrets.token_hex(3)
            serializer=EmployeeSerializer(employee)
            # Combine the user information JSON and the random string
            combined_data = random_string+"###"+ str(serializer.data)+"###"+ random_string
            
            # Encode the combined data as bytes and then encode it to base64
            base64_encoded_combined_data = base64.b64encode(combined_data.encode()).decode()
            
            # Print the random base64-encoded combined data
            # print("Random Base64-encoded Combined Data:", base64_encoded_combined_data)
            sendmail(request.data["email"],base64_encoded_combined_data)
            dtime = datetime.now()

            # Convert to a Unix timestamp
            timestamp = dtime.timestamp()
            # Convert back to a datetime object
            utc_datetime = datetime.utcfromtimestamp(timestamp)
            # Convert to the desired timezone (Asia/Dhaka)
            desired_timezone = pytz.timezone('Asia/Dhaka')
            creation_dat = utc_datetime.astimezone(desired_timezone)
            print("creation date:", creation_dat)

            dt = datetime.now()+ timedelta(minutes=5)

            # Convert to a Unix timestamp
            tmp = dt.timestamp()
            # Convert back to a datetime object
            utc_dat = datetime.utcfromtimestamp(tmp)
            # Convert to the desired timezone (Asia/Dhaka)
            desired_tz = pytz.timezone('Asia/Dhaka')
            expire_dt = utc_dat.astimezone(desired_tz)
            print("exp date:", expire_dt)



            data=ForgetPassword(
                employee_id=employee,
                email=request.data["email"],
                token=base64_encoded_combined_data,
                creation_date=creation_dat,
                expiration_date=expire_dt,
            )
            data.save()
            return Response({"message":"email sent"})
        else:
            return Response({"message":"email not varified"})
    elif 'password' in request.data:
        if 'token' in request.headers:
            print("headers :",request.headers)


    else:
        return Response({"message":"Field should contain email only"})
    return
@api_view(['POST'])
def change_password(request,token):

    return
def createTime():
    # Get the current time and add 5 minutes
    dtime = datetime.now()

    # Convert to a Unix timestamp
    timestamp = dtime.timestamp()

    # Convert back to a datetime object
    utc_datetime = datetime.utcfromtimestamp(timestamp)

    # Associate with UTC timezone
    utc_timezone = pytz.timezone('UTC')
    utc_datetime = utc_timezone.localize(utc_datetime)

    # Convert to the desired timezone (Asia/Dhaka)
    desired_timezone = pytz.timezone('Asia/Dhaka')
    creation_date = utc_datetime.astimezone(desired_timezone)

    print("Expiration date:", creation_date)
    return creation_date.replace(tzinfo=timezone.utc),
def expireTime():
    # Get the current time and add 5 minutes
    dtime = datetime.now() + timedelta(minutes=5)

    # Convert to a Unix timestamp
    timestamp = dtime.timestamp()

    # Convert back to a datetime object
    utc_datetime = datetime.utcfromtimestamp(timestamp)

    # Associate with UTC timezone
    utc_timezone = pytz.timezone('UTC')
    utc_datetime = utc_timezone.localize(utc_datetime)

    # Convert to the desired timezone (Asia/Dhaka)
    desired_timezone = pytz.timezone('Asia/Dhaka')
    exp_date = utc_datetime.astimezone(desired_timezone)

    print("Expiration date:", exp_date)
    return exp_date.replace(tzinfo=timezone.utc),
    
def sendmail(email,token):
    subject="DMC login password change"
    email_from = settings.EMAIL_HOST_USER
    message=f"please got to http://10.10.20.101:8000/?token={token}"
    send_mail(subject, message, email_from,[email,])
    return Response({"message":"mail sent"})