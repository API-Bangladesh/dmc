# Generated by Django 4.2.7 on 2024-01-01 05:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('structuedlog', '0002_structuredlog_department_structuredlog_designation'),
    ]

    operations = [
        migrations.AddField(
            model_name='structuredlog',
            name='department_name',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
        migrations.AddField(
            model_name='structuredlog',
            name='designation_name',
            field=models.CharField(blank=True, max_length=100, null=True),
        ),
    ]