# Generated by Django 4.2.7 on 2023-11-09 08:21

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('device', '0002_alter_device_group_name'),
    ]

    operations = [
        migrations.RenameField(
            model_name='device',
            old_name='group_name',
            new_name='group_id',
        ),
    ]
