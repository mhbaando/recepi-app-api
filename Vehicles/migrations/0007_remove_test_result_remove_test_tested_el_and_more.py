# Generated by Django 4.1.5 on 2023-03-19 10:26

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Vehicles', '0006_remove_test_elements_result_test_result_and_more'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='test',
            name='result',
        ),
        migrations.RemoveField(
            model_name='test',
            name='tested_el',
        ),
        migrations.CreateModel(
            name='test_result_holder',
            fields=[
                ('result_id', models.AutoField(primary_key=True, serialize=False)),
                ('status', models.BooleanField(default=False)),
                ('created_at', models.DateField(auto_now_add=True)),
                ('test_el', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Vehicles.test_elements')),
                ('test_id', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Vehicles.test')),
            ],
        ),
    ]