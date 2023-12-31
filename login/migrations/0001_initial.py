# Generated by Django 4.2.7 on 2023-12-05 05:45

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='LogInLog',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('login_date', models.DateTimeField(auto_now_add=True, null=True)),
                ('employee_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employee_employee_id', to=settings.AUTH_USER_MODEL)),
                ('username', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='employee_username', to=settings.AUTH_USER_MODEL)),
            ],
        ),
    ]
