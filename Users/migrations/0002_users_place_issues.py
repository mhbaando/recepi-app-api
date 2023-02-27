# Generated by Django 4.1.5 on 2023-02-26 11:30

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('Customers', '0008_placeissue_reg_user_alter_placeissue_created_at_and_more'),
        ('Users', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='users',
            name='place_issues',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.RESTRICT, to='Customers.placeissue'),
        ),
    ]