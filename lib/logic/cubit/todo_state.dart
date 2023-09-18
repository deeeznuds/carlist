part of 'todo_cubit.dart';

class TodoState {
  final String title;
  final String text;

  const TodoState({
    this.title = '',
    this.text = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'text': text,
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
      title: map['title'] as String,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoState.fromJson(String source) =>
      TodoState.fromMap(json.decode(source) as Map<String, dynamic>);
}
