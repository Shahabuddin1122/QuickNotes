import base64

from django.shortcuts import render
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from notes.models import *
from notes.serializers import NoteSerializer, NoteAttachmentSerializer


@api_view(['POST'])
def add_notes(request):
    if request.method == 'POST':
        data = request.data

        notes = Notes.objects.create(
            title=data.get('title', data['title']),
            description=data.get('description', data['description']),
            favorite=False
        )

        if 'attachment' in request.FILES:
            attachment = request.FILES['attachment']
            data_attachment = base64.b64encode(attachment.read()).decode('utf-8')
            note_attachment = Note_Attachment.objects.create(
                note=notes,
                image=data_attachment
            )
            note_attachment_serializer = NoteAttachmentSerializer(note_attachment)
            note_serializer = NoteSerializer(notes)
            response_data = {
                "note": note_serializer.data,
                "attachment": note_attachment_serializer.data
            }
            return Response(response_data, status=status.HTTP_201_CREATED)

        serializer = NoteSerializer(notes)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    return Response("Other than POST request not allowed", status=status.HTTP_405_METHOD_NOT_ALLOWED)


@api_view(['GET'])
def get_all_notes(request):
    notes = Notes.objects.all()
    serializer = NoteSerializer(notes, many=True)
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def get_individual_notes(request, note_id):
    try:
        note = Notes.objects.get(id=note_id)
    except Notes.DoesNotExist:
        return Response("User doesn't exist", status=status.HTTP_404_NOT_FOUND)
    serializer = NoteSerializer(note)
    return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['PUT', 'PATCH'])
def update_notes(request, note_id):
    try:
        note = Notes.objects.get(id=note_id)
    except Notes.DoesNotExist:
        return Response({"error": "Note not found"}, status=status.HTTP_404_NOT_FOUND)

    if request.method in ['PUT', 'PATCH']:
        data = request.data

        for field, value in data.items():
            if hasattr(note, field):
                setattr(note, field, value)

        note.save()
        serializer = NoteSerializer(note)
        return Response(serializer.data, status=status.HTTP_200_OK)

    return Response({"error": "Method not allowed"}, status=status.HTTP_405_METHOD_NOT_ALLOWED)
