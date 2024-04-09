from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
# Create your views here.

class AdityaApiView(APIView):
    def get(self,request):
        trialadi=User.objects.all().values()
        return Response({"Message":"List of all users : ", "User List":trialadi})