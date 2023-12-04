# Generated by Django 4.2.7 on 2023-11-26 06:11

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('device', '0005_device_device_ip'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Log',
            fields=[
                ('r_clsf_record_id', models.AutoField(primary_key=True, serialize=False)),
                ('CardName', models.CharField(default='-', max_length=100, null=True)),
                ('InTime', models.DateTimeField(null=True)),
                ('RecNo', models.IntegerField(default=0, null=True)),
                ('RoomNumber', models.CharField(default='-', max_length=100, null=True)),
                ('Status', models.IntegerField(default=0, null=True)),
                ('Type', models.CharField(default='-', max_length=100, null=True)),
                ('image_url', models.CharField(default='-', max_length=100, null=True)),
                ('device_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='device.device')),
                ('employee_id', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
