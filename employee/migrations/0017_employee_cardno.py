# Generated by Django 4.2.7 on 2023-11-21 05:59

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0016_employee_uniquecardnumber'),
    ]

    operations = [
        migrations.AddField(
            model_name='employee',
            name='cardNo',
            field=models.BigIntegerField(default=0),
        ),
    ]
