# Generated by Django 4.2.7 on 2023-11-09 08:19

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('empgrp', '0001_initial'),
        ('device', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='device',
            name='group_name',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='empgrp.group'),
        ),
    ]