# Generated by Django 4.1.5 on 2023-03-16 15:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Vehicles', '0005_test_elements_test_cat'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='test_elements',
            name='result',
        ),
        migrations.AddField(
            model_name='test',
            name='result',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='test',
            name='tested_el',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.RESTRICT, to='Vehicles.test_elements'),
        ),
    ]