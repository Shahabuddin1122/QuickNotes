from django.urls import path

from notes import views

urlpatterns = [
    path('add-note', views.add_notes, name='add_note'),
    path('get-notes', views.get_all_notes, name='get_all_notes'),
    path('get-individual-note/<int:note_id>', views.get_individual_notes, name='get_individual_notes'),
    path('update-notes/<int:note_id>', views.update_notes, name='update_notes'),
]