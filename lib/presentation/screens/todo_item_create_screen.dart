import 'package:carlist/data/models/todo_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/todo_cubit.dart';

class ToDoItemCreateScreen extends StatelessWidget {
  static String title = '';
  static String description = '';

  const ToDoItemCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var todoItemDto =
        ModalRoute.of(context)?.settings.arguments as TodoItemDto?;
    title = todoItemDto?.title ?? '';
    description = todoItemDto?.text ?? '';

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New ToDo'),
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) => title = value,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              onChanged: (value) => description = value,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (todoItemDto?.id != null) {
                BlocProvider.of<TodoCubit>(context)
                    .saveToDo(todoItemDto!.id, title, description);
                Navigator.of(context).pop();
              }
            },
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
