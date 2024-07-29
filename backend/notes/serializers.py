from rest_framework import serializers

from notes.models import *


class NoteSerializer(serializers.ModelSerializer):
    class Meta:
        model = Notes
        fields = '__all__'


class NoteAttachmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note_Attachment
        fields = '__all__'
