# Generated by Django 5.0.7 on 2024-07-30 01:20

import django.utils.timezone
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('notes', '0002_alter_note_attachment_note_alter_notes_title'),
    ]

    operations = [
        migrations.AddField(
            model_name='notes',
            name='date',
            field=models.DateField(default=django.utils.timezone.now),
            preserve_default=False,
        ),
    ]
