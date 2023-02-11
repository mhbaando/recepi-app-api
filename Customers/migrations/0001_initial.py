# Generated by Django 4.1.5 on 2023-02-11 11:51

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='blood_group',
            fields=[
                ('blood_group_id', models.AutoField(primary_key=True, serialize=False)),
                ('blood_group_name', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'blood_group',
            },
        ),
        migrations.CreateModel(
            name='company',
            fields=[
                ('company_id', models.AutoField(primary_key=True, serialize=False)),
                ('company_name', models.CharField(max_length=100)),
                ('email', models.CharField(blank=True, max_length=100, null=True)),
                ('address', models.CharField(blank=True, max_length=100, null=True)),
                ('phone', models.CharField(blank=True, max_length=100, null=True)),
                ('logo', models.FileField(blank=True, null=True, upload_to='company_logo')),
                ('website', models.CharField(blank=True, max_length=100, null=True)),
                ('reg_no', models.TextField(blank=True, null=True)),
                ('document', models.FileField(blank=True, null=True, upload_to='comapany_document')),
                ('description', models.TextField(blank=True, null=True)),
                ('is_blocked', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'company',
            },
        ),
        migrations.CreateModel(
            name='countries',
            fields=[
                ('country_id', models.AutoField(primary_key=True, serialize=False)),
                ('country_name', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'countries',
            },
        ),
        migrations.CreateModel(
            name='customer',
            fields=[
                ('customer_id', models.AutoField(primary_key=True, serialize=False)),
                ('firstname', models.CharField(blank=True, max_length=100, null=True)),
                ('middle_name', models.CharField(blank=True, max_length=100, null=True)),
                ('lastname', models.CharField(blank=True, max_length=100, null=True)),
                ('fourth_name', models.CharField(blank=True, max_length=100, null=True)),
                ('mother_name', models.CharField(blank=True, max_length=100, null=True)),
                ('full_name', models.TextField()),
                ('gender', models.CharField(blank=True, max_length=100, null=True)),
                ('date_of_birth', models.DateField(blank=True, max_length=100, null=True)),
                ('place_of_birth', models.CharField(blank=True, max_length=100, null=True)),
                ('personal_id', models.CharField(blank=True, max_length=100, null=True)),
                ('email', models.CharField(blank=True, max_length=100, null=True)),
                ('address', models.CharField(blank=True, max_length=100, null=True)),
                ('phone', models.CharField(blank=True, max_length=100, null=True)),
                ('photo', models.FileField(blank=True, null=True, upload_to='customer_images')),
                ('document', models.FileField(blank=True, null=True, upload_to='customer_document')),
                ('is_verified', models.BooleanField(default=False)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'customers',
            },
        ),
        migrations.CreateModel(
            name='customer_fingers',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('finger_print_template', models.TextField(blank=True, null=True)),
                ('finger_print_image', models.TextField(blank=True, null=True)),
            ],
            options={
                'db_table': 'fingerprints',
            },
        ),
        migrations.CreateModel(
            name='federal_state',
            fields=[
                ('state_id', models.AutoField(primary_key=True, serialize=False)),
                ('state_name', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'federal_state',
            },
        ),
        migrations.CreateModel(
            name='personal_id_type',
            fields=[
                ('personal_id', models.AutoField(primary_key=True, serialize=False)),
                ('personal_name', models.CharField(max_length=100)),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
            ],
            options={
                'db_table': 'personal_id_type',
            },
        ),
        migrations.CreateModel(
            name='license',
            fields=[
                ('license_id', models.AutoField(primary_key=True, serialize=False)),
                ('place_of_issue', models.CharField(max_length=100)),
                ('expired_date', models.DateField()),
                ('status', models.CharField(default='Active', max_length=100)),
                ('reg_no', models.TextField(blank=True, null=True)),
                ('document', models.FileField(blank=True, null=True, upload_to='comapny_document')),
                ('created_at', models.DateTimeField(auto_now_add=True)),
                ('modified_at', models.DateTimeField(auto_now=True)),
                ('federal_state', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Customers.federal_state')),
                ('owner', models.ForeignKey(on_delete=django.db.models.deletion.RESTRICT, to='Customers.customer')),
            ],
            options={
                'db_table': 'license',
            },
        ),
    ]
