# from rest_framework import serializers

# from We_Workers_models.models import User
# from We_Workers_models.models import Technician
# from We_Workers_models.models import Location
# from We_Workers_models.models import Service_Category
# from We_Workers_models.models import Service
# from We_Workers_models.models import BookingItem
# from We_Workers_models.models import Scheduling
# from We_Workers_models.models import Booking_info

# class UserSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = User
#         fields = ['user_ID','first_name','last_name','email','phone','locations','pincode','passwords','role']

# class TechnicianSerializer(serializers.ModelSerializer):
#     class Meta:
#         model = Technician
#         fields = ['Technician_Id','Technician_name','Technician_email','Technician_phone','Technician_location','Technician_pincode','Technician_Password','Technician_ID_Proof','Technician_Service_Accept']