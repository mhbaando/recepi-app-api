from django.contrib.auth.models import AbstractUser
import datetime
from django.db import models
import sys
import traceback
from django.db.models import Q
import httpagentparser


class Users(AbstractUser):
    email = models.EmailField(unique=True, )
    phone = models.CharField(max_length=50, null=False,
                             blank=False)
    gender = models.CharField(max_length=10, null=True, blank=True)
    avatar = models.FileField(upload_to="Avatars/")
    is_admin = models.BooleanField(default=False)
    is_state = models.BooleanField(default=False)
    modified_at = models.DateTimeField(auto_now=True, null=True, blank=True)
    federal_state = models.ForeignKey(
        'Customers.federal_state', on_delete=models.RESTRICT, blank=True, null=True)  # Federal state

    USERNAME_FIELD = 'email'
    REQUIRED_FIELDS = ['username']

    class Meta:
        db_table = 'users'
        ordering = ('-username',)

    def beutifyData(self):
        return PreviewDate(self.date_joined, True)

    def getUserType(self):
        if self.is_superuser:
            return "Superuser"

        if self.is_admin:
            return "Admin"

        if self.is_staff:
            return "Employee"

        return "Anonymous"
    # Profile Url
    def profileUrl(self):
        if self.avatar and hasattr(self.avatar, 'url'):
            return self.avatar.url


    @classmethod
    def create_user(cls, fname, lname, email, phone, gender, image, is_admins, is_state, is_supers, request, state=None):
        try:
            username = generateUsername()
            Users = cls(
                first_name=fname.strip(),
                last_name=lname.strip(),
                username=username,
                phone=phone,
                gender=gender,
                email=email,
                avatar=image,
                is_admin=is_admins,
                is_state=is_state,
                is_superuser=is_supers,
                is_active=False if is_state else True,
                federal_state=state
                
            )
            Users.set_password('123')
            Users.save()

            return cls.sendMessage(False, 'New user has been created')
        except Exception as error:
            username = request.user.username
            name = request.user.first_name + ' ' + request.user.last_name
            message = sendException(
                request, username, name, error)
            return cls.sendMessage(True, 'On Error Occurs . Please try again or contact system administrator')

    @classmethod
    def sendMessage(cls, error, msg):
        return {
            'isError': error,
            'Message': msg
        }

    def get_modified_date(self):
        timedelta = getCurrentDate() - self.modified_at
        seconds = timedelta.days * 24 * 3600 + timedelta.seconds
        minutes, seconds = divmod(seconds, 60)
        hours, minutes = divmod(minutes, 60)
        days, hours = divmod(hours, 24)

        if days > 0:
            return f"{days} {'day' if days == 1 else 'days'} ago"

        if hours > 0:
            return f"{hours} {'hour' if hours == 1 else 'hours'} ago"

        if minutes > 0:
            return f"{minutes} {'minute' if minutes == 1 else 'minutes'} ago"

        return f"{seconds} {'second' if seconds == 1 else 'seconds'} ago"


def PreviewDate(date_string, is_datetime, add_time=True):
    if is_datetime:
        new_date = date_string
        if add_time:
            date_string = new_date.strftime("%a") + ', ' + new_date.strftime(
                "%b") + ' ' + str(new_date.day) + ', ' + str(new_date.year) + '  ' + new_date.strftime("%I") + ':' + new_date.strftime("%M") + ':' + new_date.strftime("%S") + ' ' + new_date.strftime("%p")
        else:
            date_string = new_date.strftime("%a") + ', ' + new_date.strftime(
                "%b") + ' ' + str(new_date.day) + ', ' + str(new_date.year)
    else:
        date_string = str(date_string)
        date_string = date_string.split('-')

        new_date = datetime(int(date_string[0]), int(
            date_string[1]), int(date_string[2]))

        date_string = new_date.strftime("%a") + ', ' + new_date.strftime(
            "%b") + ' ' + str(new_date.day) + ', ' + str(new_date.year)

    return date_string


# Generating username for each user by counting from the last username
def generateUsername():
    user = ''
    letter = 'AD'

    user = Users.objects.all()

    if len(user) > 0:
        username = user[0].username
        serial = int(username[2:])
    else:
        serial = 0

    serial += 1
    if serial < 10:
        serial = '0000' + str(serial)
    elif serial < 100:
        serial = '000' + str(serial)
    elif serial < 1000:
        serial = '00' + str(serial)
    elif serial < 10000:
        serial = '0' + str(serial)
    return letter + str(serial)


class ErrorLogs(models.Model):
    Username = models.CharField(max_length=20)
    Name = models.CharField(max_length=500)
    Expected_error = models.CharField(max_length=500)
    field_error = models.CharField(max_length=500)
    trace_back = models.TextField(max_length=500)
    line_number = models.IntegerField()
    date_recorded = models.DateTimeField(auto_now_add=True)
    browser = models.CharField(max_length=500)
    ip_address = models.CharField(max_length=500)
    user_agent = models.TextField(max_length=500)
    Avatar = models.FileField(upload_to="errorlogs/", null=True, blank=True)

    class Meta:
        db_table = 'errorlogs'


class AuditTrials(models.Model):
    Avatar = models.FileField(upload_to="trials/")
    Username = models.CharField(max_length=20)
    path = models.CharField(max_length=60, null=True, blank=True)
    Name = models.CharField(max_length=200)
    Actions = models.CharField(max_length=400)
    Module = models.CharField(max_length=400)
    date_of_action = models.DateTimeField(auto_now_add=True)
    operating_system = models.CharField(max_length=200)
    browser = models.CharField(max_length=200)
    ip_address = models.CharField(max_length=200)
    user_agent = models.TextField(max_length=200)

    class Meta:
        db_table = 'audittrials'

    def reduceActions(self):
        return f"{self.Actions[:30]}..." if len(self.Actions) > 30 else self.Actions


def sendException(request, username, name, error, avatar='', model='', brand=''):
    username = username
    Name = name
    ip = request.META.get('REMOTE_ADDR')
    get_client_agent = request.META['HTTP_USER_AGENT']
    try:
        detect_os = httpagentparser.detect(
            get_client_agent)['os']['name']
    except KeyError:
        detect_os = get_client_agent
    try:
        browser = httpagentparser.detect(get_client_agent)[
            'browser']['name']
    except KeyError:
        browser = get_client_agent
    trace_err = traceback.format_exc()
    Expected_error = str(sys.exc_info()[0])
    field_error = str(sys.exc_info()[1])
    line_number = str(sys.exc_info()[-1].tb_lineno)
    user_agent = str(ip) + ","
    user_agent += str(detect_os) + ',' if brand == '' else brand + ','
    user_agent += browser if model == '' else model
    error_logs = ErrorLogs(
        Avatar=str(request.user.avatar) if avatar == '' else avatar,
        Name=Name,
        Username=username,
        ip_address=ip,
        browser=browser if model == '' else model,
        Expected_error=Expected_error,
        field_error=field_error,
        trace_back=str(trace_err),
        line_number=line_number,
        user_agent=user_agent)

    error_logs.save()

    return {
        'error': str(error),
        'isError': True,
        'title': "An error occurred please contact us"
    }


def getCurrentDate():
    time = datetime.datetime.now(datetime.timezone.utc)
    return time
