import 'dart:convert';

class Attachment {
  final int id;
  final String image;

  Attachment({
    required this.id,
    required this.image,
  });

  factory Attachment.fromMap(Map<String, dynamic> map) {
    return Attachment(
      id: map['id'] as int,
      image: map['image'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'image': image,
    };
  }
}
