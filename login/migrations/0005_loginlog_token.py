# Generated by Django 4.2.7 on 2023-12-11 08:30

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('login', '0004_remove_loginlog_unique_employee_login_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='loginlog',
            name='token',
            field=models.TextField(default='-', null=True),
        ),
    ]
