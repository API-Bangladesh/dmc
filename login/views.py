# login/views.py

from datetime import datetime, timedelta, timezone
from django.conf import settings
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework import status
from rest_framework.permissions import AllowAny
from rest_framework.authtoken.models import Token
from django.contrib.auth import authenticate
from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse
from employee.models import Employee  # Import the Employee model
from employee.serializers import EmployeeSerializer  # Import the serializer for the Employee model
# from rest_framework_simplejwt.tokens import RefreshToken
from rest_framework_simplejwt.tokens import RefreshToken

import jwt
from django.contrib.auth.hashers import make_password, check_password
from .models import LogInLog


@api_view(['POST'])
@permission_classes([AllowAny])
@csrf_exempt
def login_user(request):
    if request.method == 'POST':
        data = request.data
        employee_id = data.get('employee_id')
        password = data.get('password')
        print("employee_id :",employee_id,", password :",password)

        if employee_id and password:
            # for user in Employee.objects.all():
            #     user.password = make_password(user.password)
            #     user.save()
            hashed_password = make_password(password)

            user = authenticate(request,employee_id=employee_id, password=password)
            # user = Employee.objects.get(employee_id=employee_id)
            print("user.password :",user.password,", pasword : ",hashed_password)
            # if check_password(password, user.password):
            #     print("Password is correct.")
            # else:
            #     print("Password is incorrect.")
            
            # print("user flag :",user)
            expiration_time = datetime.utcnow() + timedelta(hours=2)
            expiration_time_gmt6 = expiration_time.replace(tzinfo=timezone.utc).astimezone(timezone(timedelta(hours=6)))

            exp_timestamp = int(expiration_time_gmt6.timestamp())
            if user is not None:
                body={
                    'id':employee_id,
                    'sub': "3346363",
                    'iat': int(datetime.utcnow().replace(tzinfo=timezone.utc).astimezone(timezone(timedelta(hours=6))).timestamp()),
                    'exp': exp_timestamp,  # Add the expiration time
                    }
                emp=Employee.objects.get(employee_id=employee_id)
                print("user : ",emp)
                
                refresh = RefreshToken.for_user(emp)


                # token = jwt.encode(body, settings.SECRET_KEY, algorithm='HS256')
                # decoded_token = jwt.decode(token,settings.SECRET_KEY ,algorithms=['HS256'])
                # try:
                #     decoded_token = jwt.decode(token, settings.SECRET_KEY, algorithms=['HS256'])
                #     print(decoded_token)
                # except jwt.ExpiredSignatureError:
                #     print("Token has expired")
                # except jwt.InvalidSignatureError as e:
                #     print("Signature verification failed")
                #     print(f"Encoded Signature: {e.signature}")
                #     print(f"Expected Signature: {e.expected_signature}")
                # # print(decoded_token)
                employee=Employee.objects.get(employee_id=employee_id)
                username=Employee.objects.filter(employee_id=employee_id).values_list("username",flat=True)
                
                log_insert=LogInLog(employee_id=employee,username=username)
                log_insert.save()
                

                serializer = EmployeeSerializer(user)
                return JsonResponse(
                        {
                        
                        'refresh':str(refresh),
                        'access':str(refresh.access_token) ,
                        'user': serializer.data,
                        }
                )
                # return Response({'token': token, 'user': serializer.data}, status=status.HTTP_200_OK)
            else:
                msg = 'Unable to log in with provided credentials.'
                return Response({'error': msg}, status=status.HTTP_401_UNAUTHORIZED)
        else:
            msg = 'Must include "email" and "password".'
            return Response({'error': msg}, status=status.HTTP_400_BAD_REQUEST)
    return JsonResponse({'error': 'Invalid request method'}, status=status.HTTP_400_BAD_REQUEST)



# serializers.py
# from rest_framework import serializers

# class PasswordResetSerializer(serializers.Serializer):
#     email = serializers.EmailField()

# # views.py
# from django.contrib.auth.models import User
# from rest_framework.decorators import api_view
# from rest_framework.response import Response
# from rest_framework import status
# # from rest_framework_simplejwt.tokens import PasswordResetToken

# @api_view(['POST'])
# def forgot_password(request):
#     serializer = PasswordResetSerializer(data=request.data)
#     if serializer.is_valid():
#         email = serializer.validated_data['email']
#         user = User.objects.get(email=email)

#         if user:
#             # Generate a password reset token
#             token = PasswordResetToken.for_user(user)
            
#             # Send the reset link via email (you need to implement this part)
#             # email contains a link like: https://yourdomain.com/reset-password/?token=generated_token

#             return Response({'success': 'Password reset link sent successfully.'}, status=status.HTTP_200_OK)
#         else:
#             return Response({'error': 'User not found.'}, status=status.HTTP_404_NOT_FOUND)
#     else:
#         return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

# # @api_view(['POST'])
# # def reset_password(request):
# #     token = request.data.get('token')
# #     new_password = request.data.get('new_password')

# #     if not token or not new_password:
# #         return Response({'error': 'Token and new password are required.'}, status=status.HTTP_400_BAD_REQUEST)

# #     try:
# #         # Verify the password reset token
# #         payload = PasswordResetToken(token).payload
# #         user = User.objects.get(id=payload['user_id'])

# #         # Set the new password for the user
# #         user.set_password(new_password)
# #         user.save()

# #         return Response({'success': 'Password reset successfully.'}, status=status.HTTP_200_OK)
# #     except Exception as e:
# #         return Response({'error': 'Invalid token or user not found.'}, status=status.HTTP_400_BAD_REQUEST)
