from rest_framework import serializers
from notes.models import Notes, Note_Attachment
from django.utils.dateformat import format


class NoteAttachmentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Note_Attachment
        fields = ['id', 'image']


class NoteSerializer(serializers.ModelSerializer):
    attachments = NoteAttachmentSerializer(many=True, read_only=True)
    formatted_date = serializers.SerializerMethodField()  # Add this field

    class Meta:
        model = Notes
        fields = ['id', 'title', 'description', 'favorite', 'date', 'formatted_date', 'attachments']

    def get_formatted_date(self, obj):
        return format(obj.date, 'b d, Y')
