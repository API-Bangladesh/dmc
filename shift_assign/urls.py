from django.urls import path
from . import views
urlpatterns=[
    path("",views.assign_shift,name="assign_shift"),
    path("<int:pk>",views.assign_shift_with_id,name="assign_shift_with_id")
]