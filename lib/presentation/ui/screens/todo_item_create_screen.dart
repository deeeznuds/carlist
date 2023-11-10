import 'package:carlist/data/models/todo_item_model.dart';
import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/todo_cubit.dart';

class TodoItemCreateScreen extends StatefulWidget {
  final TodoItemDto itemDto;

  const TodoItemCreateScreen({super.key, required this.itemDto});

  @override
  State<TodoItemCreateScreen> createState() => _TodoItemCreateScreenState();
}

class _TodoItemCreateScreenState extends State<TodoItemCreateScreen> {
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    title = widget.itemDto.title;
    description = widget.itemDto.text;
    titleController = TextEditingController(text: title);
    descriptionController = TextEditingController(text: description);
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(
        title: 'New Todo',
      ),
      body: Column(
        children: [
          TextField(
            controller: titleController,
            onChanged: (value) => title = value,
            decoration: const InputDecoration(hintText: 'Title'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: TextField(
              controller: descriptionController,
              onChanged: (value) => description = value,
              decoration: const InputDecoration(hintText: 'Description'),
            ),
          ),
          ElevatedButton(onPressed: saveTodo, child: const Text('SAVE')),
        ],
      ),
    );
  }

  void saveTodo() {
    final blocProvider = BlocProvider.of<TodoCubit>(context);

    if (blocProvider.state.items
        .any((element) => element.id == widget.itemDto.id)) {
      blocProvider.editTodo(widget.itemDto.id, title, description);
    } else {
      blocProvider.saveTodo(widget.itemDto.id, title, description);
    }

    AppRouter.router.pop();
  }
}
