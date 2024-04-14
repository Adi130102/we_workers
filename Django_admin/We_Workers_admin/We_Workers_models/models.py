from django.db import models
from django.contrib.auth.models import AbstractBaseUser, BaseUserManager
from django.core.validators import MinValueValidator, MaxValueValidator



class User(models.Model):
    user_ID=models.AutoField(primary_key=True,auto_created=True)
    first_name=models.CharField(max_length=20)
    last_name=models.CharField(max_length=20)
    email=models.EmailField(unique=True)
    phone=models.BigIntegerField()
    locations=models.CharField(max_length=190)
    pincode=models.CharField(max_length=10)
    passwords=models.CharField(max_length=100)
    role=models.BooleanField(default=False) #Bydefault false(0) for then user, if true(1) then admin

    def is_admin(self):
        return self.role    #True(1) if the user is admin, otherwise false    

class Technician(models.Model):
    Technician_Id=models.AutoField(primary_key=True)
    Technician_name=models.CharField(max_length=35)
    Technician_email=models.EmailField(unique=True)
    Technician_phone=models.BigIntegerField()
    Technician_location=models.CharField(max_length=190)
    Technician_pincode=models.CharField(max_length=10)
    Technician_Password=models.CharField(max_length=100)
    Technician_ID_Proof = models.FileField(upload_to='technician_id_proof/')  # Use FileField for generic file uploads
    # Technician_ID_Proof=models.CharField(max_length=150)
    Technician_Service_Accept=models.BooleanField(default=True) #True if the technician_service_accept is Activate

    def is_service_active(self):
        return self.Technician_Service_Accept #False if the technician_service_accept is deactivate

    def __str__(self):
        return f"Technician Id and name: {self.Technician_Id} and {self.Technician_name}"
    


# # Custom user manager for User model
# class CustomUserManager(BaseUserManager):
#     def create_user(self, email, password=None, **extra_fields):
#         if not email:
#             raise ValueError('The Email field must be set')
#         email = self.normalize_email(email)
#         user = self.model(email=email, **extra_fields)
#         user.set_password(password)
#         user.save(using=self._db)
#         return user

#     def create_superuser(self, email, password=None, **extra_fields):
#         extra_fields.setdefault('is_staff', True)
#         extra_fields.setdefault('is_superuser', True)

#         if extra_fields.get('is_staff') is not True:
#             raise ValueError('Superuser must have is_staff=True.')
#         if extra_fields.get('is_superuser') is not True:
#             raise ValueError('Superuser must have is_superuser=True.')

#         return self.create_user(email, password, **extra_fields)

# # Custom user manager for Technician model
# class TechnicianManager(BaseUserManager):
#     def create_technician(self, email, password=None, **extra_fields):
#         if not email:
#             raise ValueError('The Email field must be set')
#         email = self.normalize_email(email)
#         technician = self.model(email=email, **extra_fields)
#         technician.set_password(password)
#         technician.save(using=self._db)
#         return technician

# # User model
# class User(AbstractBaseUser):
#     user_ID = models.AutoField(primary_key=True, auto_created=True)
#     first_name = models.CharField(max_length=20)
#     last_name = models.CharField(max_length=20)
#     email = models.EmailField(unique=True)
#     phone = models.CharField(max_length=20)
#     locations = models.CharField(max_length=190)
#     pincode = models.CharField(max_length=10)
#     role = models.BooleanField(default=False)  # By default false(0) for the user, if true(1) then admin

#     objects = CustomUserManager()

#     USERNAME_FIELD = 'email'
#     REQUIRED_FIELDS = ['first_name', 'last_name', 'phone', 'locations', 'pincode']

#     def is_admin(self):
#         return self.role  # True(1) if the user is admin, otherwise false

# # Technician model
# class Technician(models.Model):
#     Technician_Id = models.AutoField(primary_key=True)
#     Technician_name = models.CharField(max_length=35)
#     Technician_email = models.EmailField(unique=True)
#     Technician_phone = models.CharField(max_length=20)
#     Technician_location = models.CharField(max_length=190)
#     Technician_pincode = models.CharField(max_length=10)
#     Technician_ID_Proof = models.CharField(max_length=150)
#     Technician_Service_Accept = models.BooleanField(default=True)  # True if the technician_service_accept is Activate

#     objects = TechnicianManager()

#     def is_service_active(self):
#         return self.Technician_Service_Accept  # False if the technician_service_accept is deactivate

# # Other models remain unchanged


class Location(models.Model):
    location_ID = models.AutoField(primary_key=True)
    # city_name = models.CharField(max_length=100)  
    area_name = models.TextField()  
    # Pin_code = models.CharField(max_length=20)  
    Latitude = models.FloatField()  
    Longitude = models.FloatField() 
    # Is_active = models.BooleanField(default=True)
    Created_at = models.DateTimeField(auto_now_add=True)
    Updated_at = models.DateTimeField(auto_now=True)  

    def __str__(self):
        return f"{self.area_name}, {self.area_name}"


class Service_Category(models.Model):
    ServiceCategory_ID = models.AutoField(primary_key=True)
    ServiceCategory_name = models.CharField(max_length=100) 
    ServiceCategory_icon = models.ImageField(upload_to='Service_Category/') 
    ServiceCategory_isActive = models.BooleanField(default=True)  # Assuming ServiceCategory_isActive is a boolean field

    def __str__(self):
        return f"ServiceCategory_name: {self.ServiceCategory_name}"


class Service(models.Model):
    Service_ID = models.AutoField(primary_key=True)
    Service_type = models.CharField(max_length=100)  
    Service_icon = models.ImageField(upload_to='service_icons/')  
    Service_description = models.TextField()  
    Service_price = models.DecimalField(max_digits=10, decimal_places=2)  
    Service_isActive = models.BooleanField(default=True)  # Assuming Service_isActive is a boolean field is True

    def __str__(self):
        return f"Service_type: {self.Service_type}"


class BookingItem(models.Model):
    Booking_item_ID = models.AutoField(primary_key=True)
    Service_ID = models.ForeignKey('Service', on_delete=models.CASCADE)
    Technician_Id = models.ForeignKey('Technician', on_delete=models.CASCADE)
    Status = models.BooleanField(default=False)  # Assuming 'False' represents 'Pending' and 'True' represents 'Completed'
    Review_Rating = models.IntegerField(default=None, null=True, validators=[MinValueValidator(1), MaxValueValidator(5)])  # Assuming star rating from 1 to 5

    class Meta:
        unique_together = ['Booking_item_ID', 'Service_ID']  # Including unique_together in the Meta class ensures that the combination of booking_item_id and service together is unique in the database. This means that each BookingItem can only be associated with a unique service.

    def __str__(self):
        return f"{self.Booking_item_ID}"



class Scheduling(models.Model):
    Scheduling_ID = models.AutoField(primary_key=True)
    Booking_item_ID = models.ForeignKey('BookingItem', on_delete=models.CASCADE)
    Date = models.DateField()
    Time = models.TimeField()

    def __str__(self):
        return f"Scheduling ID: {self.Scheduling_ID}"




class Booking_info(models.Model):
    Booking_info_ID = models.AutoField(primary_key=True)
    user_ID = models.ForeignKey('User', on_delete=models.CASCADE)  
    booking_item = models.ForeignKey('BookingItem', on_delete=models.CASCADE)
    