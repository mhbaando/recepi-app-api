# Generated by Django 4.1.5 on 2023-03-16 11:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Vehicles', '0004_test_elements_test_category_test'),
    ]

    operations = [
        migrations.AddField(
            model_name='test_elements',
            name='test_cat',
            field=models.ForeignKey(default=1, on_delete=django.db.models.deletion.RESTRICT, to='Vehicles.test_category'),
        ),
    ]