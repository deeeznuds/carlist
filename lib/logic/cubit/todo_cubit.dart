import 'dart:convert';

import 'package:carlist/data/models/todo_item_model.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> with HydratedMixin {
  TodoCubit() : super(const TodoState(items: []));

  void saveToDo(int id, String title, String text) {
    final item = TodoItemDto(id: id, title: title, text: text);
    emit(TodoState(items: [...state.items, item]));
  }

  void editToDo(int id, String title, String text) {
    var itemIndex = state.items.indexWhere((element) => element.id == id);
    state.items[itemIndex].title = title;
    state.items[itemIndex].text = text;
    emit(TodoState(items: state.items));
  }

  void clearToDo(int id) {
    state.items.removeWhere((element) => element.id == id);
    emit(TodoState(items: state.items));
  }

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }
}
