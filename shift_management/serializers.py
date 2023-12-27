from .models import ShiftManagement,ShiftAssign
from rest_framework import serializers

class ShiftManagementSerializer(serializers.ModelSerializer):
    class Meta:
        model =ShiftManagement
        fields="__all__"

class ShiftAssignSerializer(serializers.ModelSerializer):
    class Meta:
        name=ShiftAssign
        fields='__all__'
