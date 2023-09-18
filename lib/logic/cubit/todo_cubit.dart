import 'dart:convert';

import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> with HydratedMixin {
  TodoCubit() : super(const TodoState());

  void saveToDo(String title, String text) =>
      emit(TodoState(title: title, text: text));

  void editToDo() => emit(TodoState(title: state.title, text: state.text));

  void clearToDo() => emit(const TodoState(title: '', text: ''));

  @override
  TodoState? fromJson(Map<String, dynamic> json) {
    return TodoState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(TodoState state) {
    return state.toMap();
  }
}
