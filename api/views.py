from django.shortcuts import render, HttpResponse
from django.contrib.auth import authenticate, login, logout
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from rest_framework.decorators import api_view
from rest_framework.authtoken.models import Token
from django.contrib.auth.models import User
from django.db import transaction, IntegrityError
from .models import UserProfile
from django.db.models import Q
from .models import *
from .serializers import *
from .utils import get_user_from_token


def index(request):
    return HttpResponse("Hello, world. You're at the api index.")


@csrf_exempt
@api_view(['POST'])
def signup(request):
    email = request.data.get('email')
    password = request.data.get('password')
    first_name = request.data.get('first_name')
    last_name = request.data.get('last_name')
    post = request.data.get('post')

    # Validate that required fields are present
    if not email or not post or not password:
        return JsonResponse({'error': 'Email, post, and password are required'}, status=400)

    # Check if the email is unique
    if User.objects.filter(email=email).exists():
        return JsonResponse({'error': 'A user with this email already exists'}, status=400)

    with transaction.atomic():  # Ensure all operations are done in a transaction
        try:
            # Create the user
            user = User.objects.create_user(email=email, password=password)
            user.first_name = first_name
            user.last_name = last_name
            user.save()

            # Create the user profile with the post
            UserProfile.objects.create(user=user, user_type=post)

            return JsonResponse({'message': 'User created successfully'}, status=201)

        except IntegrityError:
            return JsonResponse({'error': 'Error creating user. Please try again later.'}, status=500)


@csrf_exempt
@api_view(['POST'])
def login_view(request):
    if request.method == 'POST':
        email = request.data.get('email')
        password = request.data.get('password')
        post = request.data.get('post')

        # Check if email and password are provided
        if not email or not password:
            return JsonResponse({'error': 'Email and password are required'}, status=400)

        # Authenticate user using email
        user = authenticate(request, email=email, password=password)

        if user is not None:
            # Check if the user's post matches the provided post
            user_profile = user.profile
            if user_profile.user_type != post:
                return JsonResponse({'error': 'Invalid credentials. Incorrect post provided.'}, status=401)

            login(request, user)            
            token, created = Token.objects.get_or_create(user=user)
            return JsonResponse({'token': token.key})
        else:
            return JsonResponse({'error': 'Invalid credentials'})


@api_view(['GET', 'POST'])
@csrf_exempt
def crime_hotspot(request):
    if request.method == 'GET':
        hotspots = CrimeHotspot.objects.all()
        serializer = CrimeHotspotSerializer(hotspots, many=True)
        return JsonResponse(serializer.data)
    
    elif request.method == 'POST':
        user = get_user_from_token(request)
        if user:
            serializer = CrimeHotspotSerializer(data=request.data)
            if serializer.is_valid():
                serializer.save(user=request.user)
                return JsonResponse(serializer.data, status=201)
            return JsonResponse(serializer.errors, status=400)
        else:
            return JsonResponse({'error': 'Signin required'}, status=403)
        

@api_view(['GET', 'POST'])
@csrf_exempt
def posts(request):
    if request.method == 'GET':
        posts = Post.objects.all()
        serializer = PostSerializer(posts, many=True)
        return JsonResponse(serializer.data, safe=False)
    
    elif request.method == 'POST':
        serializer = PostSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save(user=request.user)
            return JsonResponse({'message': 'Post created successfully', 'data': serializer.data}, status=201)
        return JsonResponse(serializer.errors, status=400)

    

def alerts(request):
    if request.method == 'GET':
        alerts = Alerts.objects.all()
        alerts = AlertsSerializer(alerts, many=True)
        return JsonResponse(alerts.data)
    elif request.method == 'POST':
        serializer = AlertsSerializer(data=request.data)
        if serializer.is_valid():
            serializer.save()
            return JsonResponse(serializer.data, status=201)
        return JsonResponse(serializer.errors, status=400)