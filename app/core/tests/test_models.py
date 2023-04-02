"""
Test for models
"""

from django.test import TestCase
from django.contrib.auth import get_user_model  # helper fn in order to get the default user model

class ModelTest(TestCase):
    """Tes Mdels."""

    def test_create_user_with_eamil_succefully(self):
        """Test Creatting a user with an email is succefully"""
        email = 'test@example.com'
        password = 'testpass123'
        user = get_user_model().objects.create_user(
            email=email,
            password=password
        )

        # check if the cretad user & email are equal
        self.assertEqual(user.email, email)
        self.assertTrue(user.check_password(password))