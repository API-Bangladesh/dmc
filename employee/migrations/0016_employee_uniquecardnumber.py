# Generated by Django 4.2.7 on 2023-11-20 10:59

import datetime
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('employee', '0015_auto_20231120_1539'),
    ]

    operations = [
        migrations.AddField(
            model_name='employee',
            name='UniqueCardNumber',
            field=models.DateTimeField(default=datetime.datetime(2023, 1, 1, 0, 0, tzinfo=datetime.timezone.utc)),
        ),
    ]