import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/todo_cubit.dart';

class ToDoItemCreateScreen extends StatelessWidget {
  const ToDoItemCreateScreen({super.key});

  static String title = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New ToDo'),
      ),
      body: Column(
        children: [
          TextField(onChanged: (value) => title = value),
          ElevatedButton(
            onPressed: () =>
                BlocProvider.of<TodoCubit>(context).saveToDo(title, ''),
            child: const Text('SAVE'),
          ),
        ],
      ),
    );
  }
}
