# Generated by Django 4.2.7 on 2023-11-14 09:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('device', '0005_device_device_ip'),
        ('empgrp', '0001_initial'),
        ('employee', '0006_alter_employee_group_id'),
    ]

    operations = [
        migrations.CreateModel(
            name='EmployeeGroupDevice',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('device_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='device.device')),
                ('employee_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='employee.employee')),
                ('group_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='empgrp.group')),
            ],
        ),
    ]
