"""Django command to wait for database to be availble"""
import time
from psycopg2 import OperationalError as Psycopg2Error
from django.db.utils import OperationalError
from django.core.management.base import BaseCommand


class Command(BaseCommand):
    """Django command to wait for database"""
    def handle(self, *args, **options):
        """Entery point for command"""
        # is print on the terminal we're waiting for db
        self.stdout.write('Waiting for database ...')
        # frist time -> db is false
        db_up = False
        while db_up is False:
            try:
                # check if db is ready
                self.check(databases=['default'])
                db_up = True  # when ready make it true to stop loop
                # if not ready it throws an error and we handle it except block
            except (Psycopg2Error, OperationalError):
                self.stdout.write('Database unavailble, please wait 1 sec ...')
                time.sleep(1)  # wait one second and countine the loop
        self.stdout.write(self.style.SUCCESS('Databse Availble'))
