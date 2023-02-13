# Generated by Django 4.1.5 on 2023-02-11 11:51

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('Finance', '0001_initial'),
        ('Customers', '0003_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='receipt_voucher',
            name='reg_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to=settings.AUTH_USER_MODEL),
        ),
        migrations.AddField(
            model_name='receipt_voucher',
            name='rv_from',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Customers.customer'),
        ),
        migrations.AddField(
            model_name='account',
            name='account_type',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Finance.account_types'),
        ),
        migrations.AddField(
            model_name='account',
            name='reg_user',
            field=models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to=settings.AUTH_USER_MODEL),
        ),
    ]