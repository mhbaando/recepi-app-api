from django.db import models
from Customers import models as customer_model
from Users.models import Users
# Create your models here.


class account_types(models.Model):
    type_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)

    class Meta:
        db_table = 'account_types'


class account(models.Model):
    account_id = models.AutoField(primary_key=True)
    account_name = models.CharField(max_length=100)
    account_type = models.ForeignKey(account_types, on_delete=models.RESTRICT)
    amount = models.IntegerField()
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'account'


class receipt_voucher(models.Model):
    rv_id = models.AutoField(primary_key=True)
    rv_number = models.CharField(max_length=100)
    rv_amount = models.CharField(max_length=50)
    rv_from = models.ForeignKey(
        customer_model.customer, on_delete=models.RESTRICT)
    created_at = models.DateTimeField(auto_now_add=True)
    modified_at = models.DateTimeField(auto_now=True)

    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'receipt_voucher'
