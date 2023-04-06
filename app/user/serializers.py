"""
Serializers for the user API View.
"""
from django.contrib.auth import get_user_model

from rest_framework import serializers

# serializer is a way to convert objects to and from python objects
# it takes json input and validates input -> convert python objects or a model
class UserSerializer(serializers.ModelSerializer):
    """Serializer for the user object."""

    class Meta:
        # serializer needs to know which model is represnting
        model = get_user_model() # we tell it here
        #list of feilds that we wanna make available through the serializer
        fields = ['email', 'password', 'name']
        extra_kwargs = {'password': {'write_only': True, 'min_length': 5}}

    def create(self, validated_data):
        """Create and return a user with encrypted password."""
        return get_user_model().objects.create_user(**validated_data)