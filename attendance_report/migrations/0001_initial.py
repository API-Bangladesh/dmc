# Generated by Django 4.2.7 on 2023-12-12 10:18

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('device', '0006_device_active_status'),
        ('empgrp', '0001_initial'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='AttendanceReport',
            fields=[
                ('ID', models.AutoField(primary_key=True, serialize=False)),
                ('username', models.CharField(default='-', max_length=100, null=True)),
                ('InTime', models.DateTimeField(null=True)),
                ('OutTime', models.DateTimeField(null=True)),
                ('total_work_minutes', models.IntegerField(default=0, null=True)),
                ('cumalative_work_minutes', models.IntegerField(default=0, null=True)),
                ('device_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='device.device')),
                ('employee_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
                ('group_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='empgrp.group')),
            ],
        ),
    ]
