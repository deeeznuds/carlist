import 'package:carlist/data/models/todo_item_model.dart';
import 'package:carlist/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/todo_cubit.dart';

class TodoItemsListScreen extends StatelessWidget {
  const TodoItemsListScreen({super.key});

  static List<TodoItemDto> todoItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Todo List'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            BlocBuilder<TodoCubit, TodoState>(
              builder: (context, state) {
                todoItems = state.items;
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (ctx, index) => TodoListItemWidget(
                      id: todoItems[index].id,
                      title: todoItems[index].title,
                      subtitle: todoItems[index].text,
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => AppRouter.router.push(
          AppRouter.todoCreateScreen,
          extra: TodoItemDto(id: todoItems.length + 2),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }
}

class TodoListItemWidget extends StatelessWidget {
  final int id;
  final String title;
  final String subtitle;

  const TodoListItemWidget({
    super.key,
    required this.id,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => AppRouter.router.push(
        AppRouter.todoCreateScreen,
        extra: TodoItemDto(id: id, title: title, text: subtitle),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title),
                Text(subtitle),
              ],
            ),
          ),
          const Icon(Icons.arrow_circle_right),
        ],
      ),
    );
  }
}
