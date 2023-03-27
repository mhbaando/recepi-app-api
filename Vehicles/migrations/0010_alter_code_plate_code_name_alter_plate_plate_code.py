# Generated by Django 4.1.5 on 2023-03-27 13:09

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Vehicles', '0009_alter_plate_plate_code'),
    ]

    operations = [
        migrations.AlterField(
            model_name='code_plate',
            name='code_name',
            field=models.CharField(max_length=100, unique=True),
        ),
        migrations.AlterField(
            model_name='plate',
            name='plate_code',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Vehicles.code_plate'),
        ),
    ]