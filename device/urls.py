from django.urls import path
from . import views
urlpatterns=[
    path("",views.device,name="device"),
    path("<str:pk>/",views.device_with_id,name="device_with_id"),

]