"""
Test for user API
"""

from django.test import TestCase
from django.contrib.auth import get_user_model
from django.urls import reverse

from rest_framework.test import APIClient
from rest_framework import status

# add api url
# reverse -> get the url form the name of the view
# app:endpoint
CREATE_USER_URL = reverse('user:create')

# add helper function for testing purpose
def create_user(**params):
    """Create and return a new user."""
    return get_user_model().objects.create_user(**params)

# create two test
# public -> un authenticated requests i.e registeing new user

class PublicUserApiTests(TestCase):
    """Test the public features of the user API."""

    def setUp(self):
        self.client = APIClient()  # create an api client

    def test_create_user_successs(self):
        """Test creating a suer is succefull"""
        payload = {
            'email':'test@example.com',
            'password':'testpass123',
            'name':'Test Name'
        }

        # send request the url and pass payload
        res = self.client.post(CREATE_USER_URL, payload)

        # assertion
        self.assertEqual(res.status_code, status.HTTP_201_CREATED)
        user = get_user_model().objects.get(email=payload['email'])
        self.assertTrue(user.check_password(payload['password']))
        self.assertNotIn('password', res.data) # let's not return a password

    def test_user_with_email_exists_error(self):
        """Test error returned if user with email exists."""

        payload = {
            'email':'test@example.com',
            'password':'testpass123',
            'name':'Test Name'
        }

        # create user
        get_user_model().objects.create(**payload)

        # send request
        res = self.client.post(CREATE_USER_URL)
        self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)


    def test_password_too_short_error(self):
            """Test an error is returned if password less than 5 chars."""
            payload = {
                'email': 'test@example.com',
                'password': '123',
                'name': 'Test name',
            }
            res = self.client.post(CREATE_USER_URL, payload)

            self.assertEqual(res.status_code, status.HTTP_400_BAD_REQUEST)
            user_exists = get_user_model().objects.filter(
                email=payload['email']
            ).exists()
            # and check if the user is not created in the database when user passed short password
            self.assertFalse(user_exists)
