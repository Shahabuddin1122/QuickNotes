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

        # Create the note
        notes = Notes.objects.create(
            title=data.get('title', data['title']),
            description=data.get('description', data['description']),
            favorite=False
        )

        # Check if there is an attachment
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

        # If no attachment, return just the note data
        serializer = NoteSerializer(notes)
        return Response(serializer.data, status=status.HTTP_201_CREATED)

    return Response("Other than POST request not allowed", status=status.HTTP_405_METHOD_NOT_ALLOWED)