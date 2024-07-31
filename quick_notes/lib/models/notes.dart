import 'dart:convert';

class Notes {
  final String title;
  final String description;
  final String date;
  final bool isFav;

  Notes({
    required this.title,
    required this.description,
    required this.date,
    required this.isFav,
  });

  Notes copyWith({
    String? title,
    String? description,
    String? date,
    bool? isFav,
  }) {
    return Notes(
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isFav: isFav ?? this.isFav,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'description': description,
      'date': date,
      'isFav': isFav,
    };
  }

  factory Notes.fromMap(Map<String, dynamic> map) {
    return Notes(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
      isFav: map['isFav'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory Notes.fromJson(String source) =>
      Notes.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Notes(title: $title, description: $description, date: $date, isFav: $isFav)'; // Changed from descriptions to description
  }

  @override
  bool operator ==(covariant Notes other) {
    if (identical(this, other)) return true;

    return other.title == title &&
        other.description == description &&
        other.date == date &&
        other.isFav == isFav;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        description.hashCode ^
        date.hashCode ^
        isFav.hashCode;
  }
}
