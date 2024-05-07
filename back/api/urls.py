from django.urls import path
from api.views import (
    EventDetailView,
    EventListView,
    MyTokenObtainPairView,
    UserListAPIView,
    UserDetailAPIView,
    user_events
)

urlpatterns = [
    path('events/<int:event_id>/', EventDetailView.as_view()),
    path('events/', EventListView.as_view()),
    path('login/', MyTokenObtainPairView.as_view()),
    path('users/', UserListAPIView.as_view()),
    path('users/<str:username>/', UserDetailAPIView.as_view()),
    path('users/<str:username>/events/', user_events),
]