# Generated by Django 4.2.7 on 2024-01-01 03:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('department', '0001_initial'),
        ('designation', '0001_initial'),
        ('structuedlog', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='structuredlog',
            name='department',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='department.department'),
        ),
        migrations.AddField(
            model_name='structuredlog',
            name='designation',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='designation.designation'),
        ),
    ]