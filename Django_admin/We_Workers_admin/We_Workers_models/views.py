from django.shortcuts import render
from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
# Create your views here.

class userApiView(APIView):
    def get(self,request):
        user_object=User.objects.all().values()
        return Response({"User List":user_object})
    
class TechnicianApiView(APIView):
    def get(self,request):
        Technician_object=Technician.objects.all().values()
        return Response({"Technician List":Technician_object})
    

class LocationApiView(APIView):
    def get(self,request):
        Location_object=Location.objects.all().values()
        return Response({"Location List":Location_object})

class Service_CategoryApiView(APIView):
    def get(self,request):
        Service_Category_object=Service_Category.objects.all().values()
        return Response({"Service_Category List":Service_Category_object})


class ServiceApiView(APIView):
    def get(self,request):
        Service_object=Service.objects.all().values()
        return Response({"Service List":Service_object})


class BookingItemApiView(APIView):
    def get(self,request):
        BookingItem_object=BookingItem.objects.all().values()
        return Response({"BookingItem List":BookingItem_object})


class SchedulingApiView(APIView):
    def get(self,request):
        Scheduling_object=Scheduling.objects.all().values()
        return Response({"Scheduling List":Scheduling_object})


class Booking_infoApiView(APIView):
    def get(self,request):
        Booking_info_object=Booking_info.objects.all().values()
        return Response({"Booking_info List":Booking_info_object})

