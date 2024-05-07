from rest_framework import serializers
from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from api.models import Event
from django.contrib.auth.models import User


class UserSerializer(serializers.ModelSerializer):
    id = serializers.IntegerField(read_only=True)

    class Meta:
        model = User
        fields = ['id', 'username', 'password', 'email']


class EventSerializer(serializers.ModelSerializer):
    title = serializers.CharField(max_length=255)
    description = serializers.CharField(max_length=1000)
    date = serializers.DateField(required=True)
    imageUrl = serializers.CharField(max_length=1000)
    places = serializers.IntegerField()
    time = serializers.CharField(max_length=255)
    location = serializers.CharField(max_length=255)
    participants = serializers.SlugRelatedField(slug_field="username", queryset=User.objects, many=True, required=False)

    class Meta:
        model = Event
        fields = "__all__"


class MyTokenObtainPairSerializer(TokenObtainPairSerializer):
    def validate(self, attrs):
        data = super().validate(attrs)
        return data





