"""
Database Models.
"""
from django.db import models
from django.contrib.auth.models import (
    AbstractBaseUser,
    BaseUserManager,
    PermissionsMixin
)


class UserManager(BaseUserManager):
    """Manager For Users"""
    # **extra_feilds -> we can provide keyword arguments
    def create_user(self, email, password=None,  **extra_feilds):
        """Create, Save & Return new user"""
        if not email:
            raise ValueError('Email is Required')
        user = self.model(email=self.normalize_email(email), **extra_feilds)
        user.set_password(password)
        user.save(using=self._db)  # to support adding mult db

        return user

    # make sure you dont have type inthe name of this fn
    def create_superuser(self, email, password):
        """Create and return a new superuser."""
        user = self.create_user(self.normalize_email(email), password)
        user.is_staff = True
        user.is_superuser = True
        user.save(using=self._db)

        return user


# AbstractBaseUser contains functionality for the auth system no any feild
# PermissionsMixin contains fucntionlity for
# permission & any fields ineed for permission feature


class User(AbstractBaseUser, PermissionsMixin):
    """User in the system"""
    email = models.EmailField(max_length=255, unique=True)
    name = models.CharField(max_length=255)
    is_active = models.BooleanField(default=True)
    is_staff = models.BooleanField(default=False)

    # assign UserManager to our custom model class
    objects = UserManager()  # creates instance of the manger
    USERNAME_FIELD = 'email'

# Create user model manager
