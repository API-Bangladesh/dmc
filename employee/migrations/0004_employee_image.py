# Generated by Django 4.2.7 on 2023-11-12 09:17

from django.db import migrations, models
import employee.models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0003_alter_employee_image_location_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='employee',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to=employee.models.upload_user_image),
        ),
    ]