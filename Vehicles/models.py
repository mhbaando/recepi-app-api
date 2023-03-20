from django.db import models
from Customers import models as customer_model
from Users.models import Users


class model_brand(models.Model):
    brand_id = models.AutoField(primary_key=True)
    brand_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'model_brand'

    def __str__(self):
        return self.brand_name


class color(models.Model):
    color_id = models.AutoField(primary_key=True)
    color_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'color'

    def __str__(self):
        return self.color_name


class type(models.Model):
    type_id = models.AutoField(primary_key=True)
    type_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'type'

    def __str__(self):
        return self.type_name


class cylinder(models.Model):
    cylinder_id = models.AutoField(primary_key=True)
    cylinder_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'cylinder'

    def __str__(self):
        return self.cylinder_name


class code_plate(models.Model):
    code_id = models.AutoField(primary_key=True)
    code_name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'code_plate'

    def __str__(self):
        return self.code_name


class plate(models.Model):
    plate_id = models.AutoField(primary_key=True)
    plate_code = models.ForeignKey(
        code_plate, on_delete=models.RESTRICT, null=True, blank=True)
    plate_no = models.CharField(max_length=100, null=True, blank=True)
    type = models.ForeignKey(type, on_delete=models.RESTRICT, null=True)
    year = models.IntegerField()
    state = models.ForeignKey(
        customer_model.federal_state, on_delete=models.RESTRICT)

    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'plate'

    def __str__(self):
        return self.plate_no


class vehicle(models.Model):
    vehicle_id = models.AutoField(primary_key=True)
    vehicle_model = models.ForeignKey(model_brand, on_delete=models.RESTRICT)
    year = models.IntegerField(null=True, blank=True)
    origin = models.ForeignKey(
        customer_model.countries, on_delete=models.RESTRICT)
    color = models.ForeignKey(color, on_delete=models.RESTRICT)

    cylinder = models.ForeignKey(
        to=cylinder, on_delete=models.RESTRICT)
    weight = models.CharField(max_length=100, null=True, blank=True)
    hp = models.CharField(max_length=100, null=True, blank=True)
    pessenger_seat = models.TextField(max_length=100, null=True, blank=True)
    vin = models.CharField(max_length=100, null=True, blank=True)
    enginer_no = models.CharField(max_length=100, null=True, blank=True)
    # TODO: rv here
    rv_number = models.CharField(max_length=100, null=True, blank=True)
    owner = models.ForeignKey(customer_model.customer,
                              on_delete=models.RESTRICT)

    plate_no = models.ForeignKey(
        plate, on_delete=models.RESTRICT, null=True, blank=True)

    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'vehicle'

    def __str__(self):
        return str(self.vehicle_model)


class transfare_vehicles(models.Model):
    transfare_id = models.AutoField(primary_key=True)
    vehicle = models.ForeignKey(vehicle, on_delete=models.RESTRICT)
    rv_number = models.CharField(max_length=50)

    document = models.FileField(
        null=True, blank=True, upload_to='transfare_document')
    description = models.TextField(null=True, blank=True)

    new_owner = models.ForeignKey(
        customer_model.customer, on_delete=models.RESTRICT, related_name='customer_for_new_owner')
    old_owner = models.ForeignKey(
        customer_model.customer, on_delete=models.RESTRICT, related_name='customer_for_old_owner')
    transfare_reason = models.TextField()

    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)
    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)


# MOT Models
class test_category(models.Model):
    cat_id = models.AutoField(primary_key=True)
    cat_name = models.TextField()
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    def __str__(self):
        return str(self.cat_name)


class test_elements(models.Model):
    el_id = models.AutoField(primary_key=True)
    el_name = models.TextField()
    test_cat = models.ForeignKey(
        test_category, on_delete=models.RESTRICT, default=1)
    created_at = models.DateField(auto_now_add=True)
    updated_at = models.DateField(auto_now=True)
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    def __str__(self):
        return str(self.el_name)


class test(models.Model):
    test_id = models.AutoField(primary_key=True)
    test_meter = models.BigIntegerField()
    test_num = models.BigIntegerField(default=0)
    expired_date = models.DateField()
    issue_date = models.DateField(auto_now=True)
    created_at = models.DateField(auto_now_add=True)
    tested_vehicle = models.ForeignKey(vehicle, on_delete=models.RESTRICT)
    test_cat = models.ForeignKey(test_category, on_delete=models.RESTRICT)
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    def __str__(self):
        return str(self.test_id)


class test_result_holder(models.Model):
    result_id = models.AutoField(primary_key=True)
    test_id = models.ForeignKey(test, on_delete=models.RESTRICT)
    test_el = models.ForeignKey(test_elements, on_delete=models.RESTRICT)
    status = models.BooleanField(default=False)
    created_at = models.DateField(auto_now_add=True)

    def __str__(self):
        return f"{self.test_id} {self.test_el.el_name} - {self.status}"

    def show_result(self):
        return {
            'result_status': 'Fail' if not self.status else 'Pass',
            'result_class': 'danger' if not self.status else 'success'
        }
