# Generated by Django 4.2.7 on 2023-12-05 06:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0003_loginlog_unique_employee_login'),
    ]

    operations = [
        migrations.RemoveConstraint(
            model_name='loginlog',
            name='unique_employee_login',
        ),
        migrations.AlterField(
            model_name='loginlog',
            name='username',
            field=models.CharField(default='-', max_length=100),
        ),
    ]
