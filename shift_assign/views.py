from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from shift_management.models import ShiftAssign
from shift_management.serializers import ShiftAssignSerializer 
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.

@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def assign_shift(request):
    if request.method == 'GET':
        shiftAssign=ShiftAssign.objects.all().order_by('-id')

        serializer=ShiftAssignSerializer(shiftAssign,many=True)
        return Response(serializer.data)
    if request.method == 'POST':
        print("Data :",request.data)
        shift=request.data["employee_id"]
        is_exist=ShiftAssign.objects.filter(employee_id=shift).first()
        if is_exist==None:
            shiftSerializer=ShiftAssignSerializer(data=request.data)
            if shiftSerializer.is_valid():
                shiftSerializer.save()
                return Response(shiftSerializer.data,status=status.HTTP_201_CREATED)
            else:
                return Response(shiftSerializer.errors,status=status.HTTP_400_BAD_REQUEST)
        else:
            return Response({"message":"Shift already exist !!"})
    
    return



@api_view(['GET','POST','DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def assign_shift_with_id(request,pk):
    task1 = ShiftAssign.objects.filter(id=pk).first()
    if task1!=None:
        shiftAssign=ShiftAssign.objects.get(id=pk)
        if request.method == 'GET':
            shiftSerializer=ShiftAssignSerializer(ShiftAssign,many=False)
            return Response(shiftSerializer.data,status=status.HTTP_201_CREATED)
        if request.method == 'POST':
            shiftSerializer=ShiftAssignSerializer(instance=ShiftAssign,data=request.data)
            if shiftSerializer.is_valid():
                shiftSerializer.save()
                return Response(shiftSerializer.data,status=status.HTTP_201_CREATED)
            else:
                return Response(shiftSerializer.error,status=status.HTTP_400_BAD_REQUEST)
        if request.method == 'DELETE':
            print("delete ShiftAssign :",shiftAssign)
            shiftAssign.delete()
            return Response({"message":"Shift successfully deleted!"})
    else:
        return Response({"message":"Shift is not valid"})

    return 

