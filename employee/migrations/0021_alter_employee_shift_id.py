# Generated by Django 4.2.7 on 2023-12-12 10:01

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('shift_management', '0003_alter_shiftmanagement_total_time'),
        ('employee', '0020_remove_employee_in_time_remove_employee_out_time_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='employee',
            name='shift_id',
            field=models.ForeignKey(null=True, on_delete=django.db.models.deletion.SET_NULL, to='shift_management.shiftmanagement'),
        ),
    ]