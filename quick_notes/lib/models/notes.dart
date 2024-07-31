import 'dart:convert';

import 'package:quick_notes/models/attachment.dart';

class Notes {
  final int id;
  final String title;
  final String description;
  final String date;
  final String formattedDate;
  final bool favorite;
  final List<Attachment> attachments;

  Notes({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.formattedDate,
    required this.favorite,
    required this.attachments,
  });

  Notes copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    String? formattedDate,
    bool? favorite,
    List<Attachment>? attachments,
  }) {
    return Notes(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      formattedDate: formattedDate ?? this.formattedDate,
      favorite: favorite ?? this.favorite,
      attachments: attachments ?? this.attachments,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'description': description,
      'date': date,
      'formatted_date': formattedDate,
      'favorite': favorite,
      'attachments': attachments.map((x) => x.toMap()).toList(),
    };
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      formattedDate: map['formatted_date'] as String,
      favorite: map['favorite'] as bool,
      attachments: List<Attachment>.from(
        (map['attachments'] as List<dynamic>).map<Attachment>(
            (x) => Attachment.fromMap(x as Map<String, dynamic>)),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) =>
      Notes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notes(id: $id, title: $title, description: $description, date: $date, formattedDate: $formattedDate, favorite: $favorite, attachments: $attachments)';
  }

  @override
  bool operator ==(covariant Notes other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.description == description &&
        other.date == date &&
        other.formattedDate == formattedDate &&
        other.favorite == favorite &&
        listEquals(other.attachments, attachments);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        formattedDate.hashCode ^
        favorite.hashCode ^
        attachments.hashCode;
  }
}

bool listEquals<T>(List<T>? a, List<T>? b) {
  if (a == null) return b == null;
  if (b == null || a.length != b.length) return false;
  for (int i = 0; i < a.length; i++) {
    if (a[i] != b[i]) return false;
  }
  return true;
}
