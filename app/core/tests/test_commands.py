"""
Test customer django management command
"""
# pathc will mock the database behavior
from unittest.mock import patch
# operational error we get when call db
from psycopg2 import OperationalError as Psycopg2Error

# helper function to simulate or call the command we're testing
from django.core.management import call_command
from django.db.utils import OperationalError  # onther error form db
from django.test import SimpleTestCase

# Mock the database behvior
# check is method that we inherit base class
# core app -> management folder -> commands folder ->
# wait for db file -> command class


@patch('core.management.commands.wait_for_db.Command.check')
class CommandTests(SimpleTestCase):
    """Test Commands."""

    # patched_check we get if from @patch decorator
    # we handled it here
    def test_wair_for_db_ready(self, patched_check):
        """Test wiating for database if database ready"""
        patched_check.return_value = True

        # excutes the code inside the wait_for_db command
        call_command('wait_for_db')

        # check if check method is called
        patched_check.assert_called_once_with(databases=['default'])

    # what happens if db is not ready ->
    # means db returns exceptions that tells the db is not ready

    #  we need to handle sleep
    # 1. check db -> wait -> check again,
    # we have to mock up this particular method
    @patch('time.sleep')
    def test_wait_for_db_delay(self, patched_sleep, patched_check):
        # it hase to be called exact order
        """Test waiting for database when getting operational error"""
        # this is how mocking works when you raise an exception
        # side_effect = allows you to parse in varois different
        # items handled differently dependign on their type
        #  *2 meants two times rais psycopg2err
        # \ means break the line
        # the next 3 times we need rais operational error
        # the 6 times returns true
        patched_check.side_effect = [Psycopg2Error] * 2 + \
            [OperationalError] * 3 + [True]

        # then call the command
        call_command('wait_for_db')

        # then check if we called the comman 6 times
        self.assertEqual(patched_check.call_count, 6)

        patched_check.assert_called_with(databases=['default'])
