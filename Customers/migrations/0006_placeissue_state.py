# Generated by Django 4.1.5 on 2023-03-13 12:27

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Customers', '0005_alter_company_options'),
    ]

    operations = [
        migrations.AddField(
            model_name='placeissue',
            name='state',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.federal_state'),
        ),
    ]
