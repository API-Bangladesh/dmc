# from django.urls import path
# from . import views
# from .views import create_employee
# from .views import ProductListAPIView

# urlpatterns = [
#     path('', views.employee_list, name='employee_list'),
#     path('employee/', views.create_employee, name='create_employee'),
#     path('employee/<str:pk>',views.edit_update_delete, name='edit_update_delete'),
    

#     # Add more paths as needed
# ]


from django.urls import path
from . import views

urlpatterns = [
	# path('', views.apiOverview, name="api-overview"),
	# path('employee/', views.employee, name="employee"),
	# path('employee/<str:pk>/', views.employee_with_id, name="employee_with_id"),
    
	path('', views.employee, name="employee"),
	path('<str:pk>/', views.employee_with_id, name="employee_with_id"),
    path('mis/<str:pk>/',views.get_employee_info_from_mis,name="employee_with_id")
]
