from django.db import models
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User

class UserProfile(models.Model):
    USER_ROLE = (
        ('constable', 'Constable'),
        ('inspector', 'Inspector'),
        ('supritendent', 'Supritendent')
    )    
    user = models.OneToOneField(User, on_delete=models.CASCADE, related_name='profile')
    user_type = models.CharField(max_length=20, choices=USER_ROLE, default='user')
    
    def __str__(self):
        return f"{self.user.username} Profile"


class CrimeHotspot(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    latitude = models.FloatField()
    longitude = models.FloatField()
    crime_type = models.CharField(max_length=50)
    intensity = models.IntegerField(default=1)
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.crime_type} at ({self.latitude}, {self.longitude})"
    

class Post(models.Model):
    latitude = models.FloatField()
    longitude = models.FloatField()
    image = models.ImageField(upload_to='post_images/')
    description = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"Post at ({self.latitude}, {self.longitude})"
    

class Alerts(models.Model):
    title = models.CharField(max_length=50)
    description = models.TextField()
    from_date = models.DateTimeField()
    to_date = models.DateTimeField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f"{self.alert_type} at ({self.latitude}, {self.longitude})"