# Generated by Django 4.2.7 on 2024-01-04 08:07

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0008_rename_gruop_name_employee_group_name'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='employee',
            name='group_name',
        ),
    ]