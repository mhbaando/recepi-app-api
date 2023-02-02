# Generated by Django 4.1.5 on 2023-02-02 12:15

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Finance', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='account_types',
            fields=[
                ('type_id', models.AutoField(primary_key=True, serialize=False)),
                ('name', models.CharField(max_length=100)),
            ],
            options={
                'db_table': 'account_types',
            },
        ),
        migrations.AlterField(
            model_name='account',
            name='account_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Finance.account_types'),
        ),
    ]
