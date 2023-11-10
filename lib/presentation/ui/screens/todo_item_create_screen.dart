import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carlist/data/models/todo_item_model.dart';
import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/widgets/appbar_widget.dart';

import '../../../logic/cubit/todo_cubit.dart';

class TodoItemCreateScreenArgs {
  final TodoItemDto itemDto;

  const TodoItemCreateScreenArgs({required this.itemDto});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemDto': itemDto.toMap(),
    };
  }

  factory TodoItemCreateScreenArgs.fromMap(Map<String, dynamic> map) {
    return TodoItemCreateScreenArgs(
      itemDto: TodoItemDto.fromMap(map['itemDto'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoItemCreateScreenArgs.fromJson(String source) =>
      TodoItemCreateScreenArgs.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class TodoItemCreateScreen extends StatefulWidget {
  final Map<String, dynamic> args;

  const TodoItemCreateScreen({
    Key? key,
    required this.args,
  }) : super(key: key);

  @override
  State<TodoItemCreateScreen> createState() => _TodoItemCreateScreenState();
}

class _TodoItemCreateScreenState extends State<TodoItemCreateScreen> {
  late final TodoItemCreateScreenArgs args;
  late final TextEditingController titleController;
  late final TextEditingController descriptionController;

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    args = TodoItemCreateScreenArgs.fromMap(widget.args);
    title = args.itemDto.title;
    description = args.itemDto.text;
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
        .any((element) => element.id == args.itemDto.id)) {
      blocProvider.editTodo(args.itemDto.id, title, description);
    } else {
      blocProvider.saveTodo(args.itemDto.id, title, description);
    }

    AppRouter.router.pop();
  }
}
