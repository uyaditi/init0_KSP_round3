# serializers.py
from rest_framework import serializers
from .models import *

class CrimeHotspotSerializer(serializers.ModelSerializer):
    class Meta:
        model = CrimeHotspot
        fields = ['latitude', 'longitude', 'crime_type', 'intensity', 'created_at']

class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = ['id', 'latitude', 'longitude', 'image', 'description', 'created_at']
        read_only_fields = ['id', 'created_at']


class AlertsSerializer(serializers.ModelSerializer):
    class Meta:
        model = Alerts
        fields = ['title', 'description', 'from_date', 'to_date', 'created_at']