from django.db import models
from Users.models import Users
# Create your models here.


class blood_group(models.Model):
    blood_group_id = models.AutoField(primary_key=True)
    blood_group_name = models.CharField(max_length=100)

    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'blood_group'

    def __str__(self):
        return {
            'blood_group_id': self.blood_group_id,
            'blood_group_name': self.blood_group_name
        }


class personal_id_type(models.Model):
    personal_id = models.AutoField(primary_key=True)
    personal_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'personal_id_type'

    def __str__(self):
        return {
            'personal_id': self.personal_id,
            'personal_name': self.personal_name
        }


class countries(models.Model):
    country_id = models.AutoField(primary_key=True)
    country_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'countries'

    def __str__(self):
        return {
            'country_id': self.country_id,
            'country_name': self.country_name
        }


class federal_state(models.Model):
    state_id = models.AutoField(primary_key=True)
    state_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    class Meta:
        db_table = 'federal_state'

    def __str__(self):
        return {
            'state_id': self.state_id,
            'state_name': self.state_name
        }


class customer(models.Model):
    customer_id = models.AutoField(primary_key=True)
    firstname = models.CharField(max_length=100, null=True, blank=True)
    middle_name = models.CharField(max_length=100, null=True, blank=True)
    lastname = models.CharField(max_length=100, null=True, blank=True)
    fourth_name = models.CharField(max_length=100, null=True, blank=True)
    mother_name = models.CharField(max_length=100, null=True, blank=True)
    gender = models.CharField(max_length=100, null=True, blank=True)
    date_of_birth = models.DateField(max_length=100, null=True, blank=True)
    place_of_birth = models.CharField(max_length=100, null=True, blank=True)
    blood_group = models.ForeignKey(
        to=blood_group, on_delete=models.RESTRICT, blank=True, null=True)  # Table Blood Group
    personal_id_type = models.ForeignKey(
        to=personal_id_type, on_delete=models.RESTRICT, blank=True, null=True)  # Personal ID Type

    nationality = models.ForeignKey(countries, on_delete=models.RESTRICT)
    personal_id = models.CharField(max_length=100, null=True, blank=True)
    email = models.CharField(max_length=100, null=True, blank=True)
    address = models.CharField(max_length=100, null=True, blank=True)
    federal_state = models.ForeignKey(
        to=federal_state, on_delete=models.RESTRICT, blank=True, null=True)  # Federal state
    phone = models.CharField(max_length=100, null=True, blank=True)
    photo = models.FileField(null=True,
                             blank=True, upload_to='customer_images')
    document = models.FileField(
        null=True, blank=True, upload_to='customer_document')

    is_verified = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'customers'


class customer_fingers(models.Model):
    customer = models.ForeignKey(
        to=customer, on_delete=models.CASCADE, blank=True, null=True)
    finger_print_template = models.TextField(
        null=True, blank=True)
    finger_print_image = models.TextField(
        null=True, blank=True)

    class Meta:
        db_table = 'fingerprints'


class company(models.Model):
    company_id = models.AutoField(primary_key=True)
    company_name = models.CharField(max_length=100)
    email = models.CharField(max_length=100, null=True, blank=True)
    address = models.CharField(max_length=100, null=True, blank=True)
    federal_state = models.ForeignKey(
        to=federal_state, on_delete=models.RESTRICT, blank=True, null=True)  # Federal state
    phone = models.CharField(max_length=100, null=True, blank=True)
    logo = models.FileField(null=True,
                            blank=True, upload_to='company_logo')
    website = models.CharField(max_length=100, null=True, blank=True)
    reg_no = models.TextField(null=True, blank=True)
    document = models.FileField(
        null=True, blank=True, upload_to='comapany_document')
    description = models.TextField(null=True, blank=True)
    owner = models.ForeignKey(customer, on_delete=models.RESTRICT)
    is_blocked = models.BooleanField(default=False)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'company'


class license(models.Model):
    license_id = models.AutoField(primary_key=True)
    place_of_issue = models.CharField(max_length=100)
    expired_date = models.DateField()
    federal_state = models.ForeignKey(
        to=federal_state, on_delete=models.RESTRICT)  # Federal state
    status = models.CharField(max_length=100, default='Active')
    reg_no = models.TextField(null=True, blank=True)
    document = models.FileField(
        null=True, blank=True, upload_to='comapny_document')
    owner = models.ForeignKey(customer, on_delete=models.RESTRICT)
    receipt_voucher = models.ForeignKey(
        to="Finance.receipt_voucher", on_delete=models.RESTRICT, null=True, blank=True, related_name="receipt_voucher")
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # TODO: user here
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    # TODO: resoipt herer
    class Meta:
        db_table = 'license'
