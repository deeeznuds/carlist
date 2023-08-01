import 'package:flutter_bloc/flutter_bloc.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoState());

  void saveToDo(String title, String text) =>
      emit(TodoState(title: title, text: text));

  void editToDo() => emit(TodoState(title: state.title, text: state.text));

  void clearToDo() => emit(TodoState(title: '', text: ''));
}
