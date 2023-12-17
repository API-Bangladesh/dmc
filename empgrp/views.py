from django.shortcuts import render
from .models import Group
from .serializers import GroupSerializer
from rest_framework import status
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.decorators import api_view, authentication_classes, permission_classes
from rest_framework_simplejwt.authentication import JWTAuthentication
from rest_framework.permissions import IsAuthenticated
# Create your views here.
@api_view(['GET','POST'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def group(request):
    if request.method == 'GET':
        dev=Group.objects.all().order_by('-group_id')
        print("Group data :",dev)

        serializer=GroupSerializer(dev,many=True)
        return Response(serializer.data)
    if request.method == 'POST':
        print("Data :",request.data)
        desiSerializer=GroupSerializer(data=request.data)
        if desiSerializer.is_valid():
            desiSerializer.save()
            return Response(desiSerializer.data,status=status.HTTP_201_CREATED)
        else:
            return Response(desiSerializer.errors,status=status.HTTP_400_BAD_REQUEST)
    
    return



@api_view(['GET','POST','DELETE'])
@authentication_classes([JWTAuthentication])
@permission_classes([IsAuthenticated])
def group_with_id(request,pk):
    
    task1 = Group.objects.filter(group_id=pk).first()
    if task1!=None:
        dev=Group.objects.get(group_id=pk)
        if request.method == 'GET':
            desSerializer=GroupSerializer(dev,many=False)
            return Response(desSerializer.data,status=status.HTTP_201_CREATED)
        if request.method == 'POST':
            desSerializer=GroupSerializer(instance=dev,data=request.data)
            if desSerializer.is_valid():
                desSerializer.save()
                return Response(desSerializer.data,status=status.HTTP_201_CREATED)
            else:
                return Response(desSerializer.error,status=status.HTTP_400_BAD_REQUEST)
        if request.method == 'DELETE':
            dev.delete()
            return Response({"message":"Group successfully deleted!"})
    else:
        return Response({"message":"Group id is not valid"})

    return 


