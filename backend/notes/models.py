from django.db import models


# Create your models here.
class Notes(models.Model):
    title = models.TextField()
    description = models.TextField()
    favorite = models.BooleanField()


class Note_Attachment(models.Model):
    note = models.ForeignKey(Notes, related_name='attachments', on_delete=models.CASCADE)
    image = models.TextField()
