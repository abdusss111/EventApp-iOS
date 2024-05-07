from django.contrib.auth.models import User
from django.db import models


class Event(models.Model):
    title = models.CharField(max_length=255)
    description = models.TextField()
    date = models.CharField(max_length=255)
    imageUrl = models.CharField(max_length=500)
    places = models.IntegerField()
    time = models.CharField(max_length=255)
    location = models.CharField(max_length=255)
    participants = models.ManyToManyField(User, related_name='events', blank=True)

    def __str__(self):
        return self.title
