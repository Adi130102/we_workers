from django.contrib import admin

from We_Workers_models.models import User
from We_Workers_models.models import Technician
from We_Workers_models.models import Location
from We_Workers_models.models import Service_Category
from We_Workers_models.models import Service
from We_Workers_models.models import BookingItem
from We_Workers_models.models import Scheduling
from We_Workers_models.models import Booking_info


# class UserAdmin(admin.ModelAdmin):
#     list_display = ('user_ID', 'first_name', 'last_name', 'email', 'phone', 'locations', 'pincode', 'role')
#     readonly_fields = ('password',)  # Prevents editing of password field

# admin.site.register(User, UserAdmin)

class User_registration_Admin(admin.ModelAdmin):
    list_display=['user_ID','first_name','last_name','email','phone','locations','pincode','passwords','role']
    list_display_links=['user_ID']

admin.site.register(User,User_registration_Admin)


# class TechnicianAdmin(admin.ModelAdmin):
#     list_display = ('Technician_Id', 'Technician_name', 'Technician_email', 'Technician_phone', 'Technician_location', 'Technician_pincode', 'Technician_ID_Proof', 'Technician_Service_Accept')
#     readonly_fields = ('password',)  # Prevents editing of password field

# admin.site.register(Technician, TechnicianAdmin)


class Technician_Table_admin(admin.ModelAdmin):
    list_display=['Technician_Id','Technician_name','Technician_email','Technician_phone','Technician_location','Technician_pincode','Technician_Password','Technician_ID_Proof','Technician_Service_Accept']
    list_display_links=['Technician_Id']

admin.site.register(Technician,Technician_Table_admin)


class Location_Table_admin(admin.ModelAdmin):
    list_display=['location_ID','city_name','area_name','Pin_code','Latitude','Longitude','Is_active','Created_at','Updated_at']
    list_display_links=['location_ID']

admin.site.register(Location,Location_Table_admin)


class Service_Category_admin(admin.ModelAdmin):
    list_display=['ServiceCategory_ID','ServiceCategory_name','ServiceCategory_icon','ServiceCategory_isActive']
    list_display_links=['ServiceCategory_ID']

admin.site.register(Service_Category,Service_Category_admin)


class Service_admin(admin.ModelAdmin):
    list_display=['Service_ID','Service_type','Service_icon','Service_description','Service_price','Service_isActive']
    list_display_links=['Service_ID']

admin.site.register(Service,Service_admin)


class BookingItem_admin(admin.ModelAdmin):
    list_display=['Booking_item_ID','Service_ID','Technician_Id','Status','Review_Rating']
    list_display_links=['Booking_item_ID']


admin.site.register(BookingItem,BookingItem_admin)



class Scheduling_admin(admin.ModelAdmin):
    list_display=['Scheduling_ID','Booking_item_ID','Date','Time']
    list_display_links=['Scheduling_ID']

admin.site.register(Scheduling,Scheduling_admin)


class Booking_info_admin(admin.ModelAdmin):
    list_display=['Booking_info_ID','user_ID','booking_item']
    list_display_links=['Booking_info_ID']

admin.site.register(Booking_info,Booking_info_admin)
