# Generated by Django 4.1.5 on 2023-03-09 09:09

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('Customers', '0003_alter_customer_options'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='company',
            options={'permissions': [('block_company', 'Can block Company')]},
        ),
    ]