from django.urls import path
from . import views
urlpatterns=[
    path("",views.devices,name="devices"),
    path("<str:pk>/",views.devices_with_id,name="devices_with_id"),

]