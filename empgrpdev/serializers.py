from rest_framework import serializers
from .models import GroupByDevice
class GroupByDeviceSerializer(serializers.ModelSerializer):
    class  Meta:
        model =GroupByDevice
        fields='__all__'
        