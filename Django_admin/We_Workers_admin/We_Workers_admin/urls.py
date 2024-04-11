"""
URL configuration for We_Workers_admin project.

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/5.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.urls import re_path
from django.conf import settings
from django.conf.urls.static import static
# from django.conf.urls import url
from We_Workers_models import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path('userAPI/',views.userApiView.as_view()),
    path('technicianAPI/',views.TechnicianApiView.as_view()),
    path('LocationAPI/',views.LocationApiView.as_view()),
    path('Service_CategoryAPI/',views.Service_CategoryApiView.as_view()),
    path('ServiceAPI/',views.ServiceApiView.as_view()),
    path('BookingItemAPI/',views.BookingItemApiView.as_view()),
    path('SchedulingAPI/',views.SchedulingApiView.as_view()),
    path('Booking_infoAPI/',views.Booking_infoApiView.as_view()),
]


if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
