from rest_framework import serializers

from notes.models import *


class NoteAttachmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note_Attachment
        fields = ['id', 'image']


class NoteSerializer(serializers.ModelSerializer):
    attachments = NoteAttachmentSerializer(many=True, read_only=True)

    class Meta:
        model = Notes
        fields = ['id', 'title', 'description', 'favorite', 'attachments']
