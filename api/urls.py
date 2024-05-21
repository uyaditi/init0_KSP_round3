from django.urls import path
from .views import *
from django.conf import settings
from django.conf.urls.static import static
from django.views.decorators.csrf import csrf_exempt

urlpatterns = [
    path('', index, name='index'),
    path('crime_hotspot', csrf_exempt(crime_hotspot), name='crime_hotspot'),
    path('posts', csrf_exempt(posts), name='posts'),
    path('alerts', csrf_exempt(alerts), name='alerts'),
]

if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)