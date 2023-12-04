from django.shortcuts import render
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework import status
from .models import GroupByDevice
from .serializers import GroupByDeviceSerializer
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.
@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def empgrpdev(request):
    grpdev = GroupByDevice.objects.all().order_by('-id')
    if request.method =='GET':
        serializer=GroupByDeviceSerializer(grpdev,many=True)
        return Response(serializer.data)
    if request.method == 'POST':
        serializer=GroupByDeviceSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data)
        else:
            return Response(serializer.errors,status=status.HTTP_400_BAD_REQUEST)

@api_view(['GET','POST','DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def empgrpdev_with_id(request,pk):
    grpdev = GroupByDevice.objects.get(id=pk)
    if grpdev!=None:
        if request.method == 'GET':
            gserializer =GroupByDeviceSerializer(grpdev)
            return Response(gserializer.data)
        if  request.method == 'POST':
            pserializer= GroupByDeviceSerializer(instance=grpdev,data=request.data)
            if pserializer.is_valid():
                pserializer.save()
                return Response(pserializer.data)
            else:
                return Response(pserializer.errors,status=status.HTTP_400_BAD_REQUEST)
        if request.method == 'DELETE':
            grpdev.delete()
            return Response({"message":"Deletion successful!!"})
    else:
        return Response({"message":"Employee id is not valid"})