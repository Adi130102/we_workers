from rest_framework import serializers

from We_Workers_models.models import *

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['user_ID','first_name','last_name','email','phone','locations','pincode','passwords','role']

class TechnicianSerializer(serializers.ModelSerializer):
    class Meta:
        model = Technician
        fields = ['Technician_Id','Technician_name','Technician_email','Technician_phone','Technician_location','Technician_pincode','Technician_Password','Technician_ID_Proof','Technician_Service_Accept']

class LocationSerializer(serializers.ModelSerializer):
    class Meta:
        model = Location
        fields = ['location_ID','city_name','area_name','Pin_code','Latitude','Longitude','Is_active','Created_at','Updated_at']

class Service_CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Service_Category
        fields = ['ServiceCategory_ID','ServiceCategory_name','ServiceCategory_icon','ServiceCategory_isActive']

class ServiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Service
        fields = ['Service_ID','Service_type','Service_icon','Service_description','Service_price','Service_isActive']

class BookingItemSerializer(serializers.ModelSerializer):
    class Meta:
        model = BookingItem
        fields = ['Booking_item_ID','Service_ID','Technician_Id','Status','Review_Rating']
        unique_together = ['Booking_item_ID', 'Service_ID']  # Including unique_together in the Meta class ensures that the combination of booking_item_id and service together is unique in the database. This means that each BookingItem can only be associated with a unique service.

class SchedulingSerializer(serializers.ModelSerializer):
    class Meta:
        model = Scheduling
        fields = ['Scheduling_ID','Booking_item_ID','Date','Time']

class Booking_infoSerializer(serializers.ModelSerializer):
    class Meta:
        model = Booking_info
        fields = ['Booking_info_ID','user_ID','booking_item']
