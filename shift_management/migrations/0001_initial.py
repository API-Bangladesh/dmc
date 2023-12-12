# Generated by Django 4.2.7 on 2023-12-12 08:12

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='ShiftManagement',
            fields=[
                ('shift_id', models.AutoField(primary_key=True, serialize=False)),
                ('shift_begining', models.TimeField(default='00:00:00')),
                ('shift_end', models.TimeField(default='00:00:00')),
                ('total_time', models.IntegerField(default=0)),
            ],
        ),
    ]
