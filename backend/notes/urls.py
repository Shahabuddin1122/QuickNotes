from django.urls import path

from notes import views

urlpatterns = [
    path('add-note', views.add_notes, name='add_note'),
]