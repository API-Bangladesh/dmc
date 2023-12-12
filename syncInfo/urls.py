from django.urls import path
from .views import syncInfo
urlpatterns=[
    path("",syncInfo,name="syncinfo")
]