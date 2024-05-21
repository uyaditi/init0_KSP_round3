from django.contrib.auth.models import User
from rest_framework.authtoken.models import Token

def get_user_from_token(request):
    auth_header = request.headers.get('Authorization')
    if auth_header:
        try:
            _, token_key = auth_header.split()
            token = Token.objects.get(key=token_key)
            return token.user
        except (ValueError, Token.DoesNotExist):
            return None
    return None
