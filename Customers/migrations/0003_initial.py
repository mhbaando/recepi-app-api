# Generated by Django 4.1.5 on 2023-02-11 11:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Customers', '0002_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='license',
            name='reg_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='customer_fingers',
            name='customer',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='Customers.customer'),
        ),
        migrations.AddField(
            model_name='customer',
            name='blood_group',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.blood_group'),
        ),
        migrations.AddField(
            model_name='customer',
            name='federal_state',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.federal_state'),
        ),
        migrations.AddField(
            model_name='customer',
            name='nationality',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Customers.countries'),
        ),
        migrations.AddField(
            model_name='customer',
            name='personal_id_type',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.personal_id_type'),
        ),
        migrations.AddField(
            model_name='customer',
            name='reg_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='company',
            name='federal_state',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.federal_state'),
        ),
        migrations.AddField(
            model_name='company',
            name='owner',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Customers.customer'),
        ),
        migrations.AddField(
            model_name='company',
            name='reg_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to=settings.AUTH_USER_MODEL),
        ),
    ]