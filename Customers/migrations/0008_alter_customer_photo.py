# Generated by Django 4.1.5 on 2023-03-20 15:04

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('Customers', '0007_alter_license_options'),
    ]

    operations = [
        migrations.AlterField(
            model_name='customer',
            name='photo',
            field=models.ImageField(blank=True, null=True, upload_to='customer_images'),
        ),
    ]