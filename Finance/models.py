from django.db import models
from Customers import models as customer_model
from Users.models import Users
# Create your models here.


class account_types(models.Model):
    type_id = models.AutoField(primary_key=True)
    name = models.CharField(max_length=100)
    created_at = models.DateTimeField(auto_now_add=True, null=True, blank=True)
    modified_at = models.DateTimeField(auto_now=True, null=True, blank=True)
    reg_user = models.ForeignKey(
        Users, on_delete=models.RESTRICT, null=True, blank=True)

    class Meta:
        db_table = 'account_types'

    def __str__(self):
        return self.name


class account(models.Model):
    account_id = models.AutoField(primary_key=True)
    account_name = models.CharField(max_length=100)
    account_type = models.ForeignKey(account_types, on_delete=models.RESTRICT)
    account_number = models.IntegerField(blank=True, null=True)
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
    reason = models.CharField(max_length=250, null=True, blank=True)
    modified_at = models.DateTimeField(auto_now=True)
    # Todo: user relation
    reg_user = models.ForeignKey(Users, on_delete=models.RESTRICT)

    class Meta:
        db_table = 'receipt_voucher'

    def __str__(self) -> str:
        return self.rv_number
