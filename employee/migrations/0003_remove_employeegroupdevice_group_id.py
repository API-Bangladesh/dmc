# Generated by Django 4.2.7 on 2023-12-27 06:48

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0002_employeegroupdevice_action'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employeegroupdevice',
            name='group_id',
        ),
    ]