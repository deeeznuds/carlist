part of 'todo_cubit.dart';

class TodoState {
  final List<TodoItemDto> items;

  const TodoState({
    required this.items,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory TodoState.fromMap(Map<String, dynamic> map) {
    return TodoState(
      items: List<TodoItemDto>.from(
        (map['items'] as List<int>).map<TodoItemDto>(
          (x) => TodoItemDto.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoState.fromJson(String source) =>
      TodoState.fromMap(json.decode(source) as Map<String, dynamic>);
}
