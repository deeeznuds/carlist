// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class TodoItemDto {
  final int id;
  String title;
  String text;

  TodoItemDto({
    required this.id,
    this.title = '',
    this.text = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'text': text,
    };
  }

  factory TodoItemDto.fromMap(Map<String, dynamic> map) {
    return TodoItemDto(
      id: map['id'] as int,
      title: map['title'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItemDto.fromJson(String source) =>
      TodoItemDto.fromMap(json.decode(source) as Map<String, dynamic>);
}
