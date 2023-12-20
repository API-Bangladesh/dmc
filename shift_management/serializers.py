from .models import ShiftManagement
from rest_framework import serializers

class ShiftManagementSerializer(serializers.ModelSerializer):
    class Meta:
        model =ShiftManagement
        fields="__all__"