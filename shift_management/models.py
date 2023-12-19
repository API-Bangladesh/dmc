from datetime import datetime
from django.db import models

# Create your models here.
class ShiftManagement(models.Model):
    shift_id=models.AutoField(primary_key=True)
    shift_beginning=models.TimeField(default="00:00:00")
    shift_end=models.TimeField(default="00:00:00")
    total_time=models.DurationField(blank=True, null=True)
    shift_name=models.CharField(max_length=100,null=True,default="-")
    def save(self, *args, **kwargs):
        # Convert time fields to datetime objects
        beginning = datetime.combine(datetime.today(), self.shift_beginning)
        end = datetime.combine(datetime.today(), self.shift_end)
        
        # Calculate the time difference and update total_time before saving
        if self.shift_beginning and self.shift_end:
            self.total_time = end - beginning
        super().save(*args, **kwargs)
    