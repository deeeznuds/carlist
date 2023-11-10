import 'package:carlist/data/models/todo_item_model.dart';
import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/screens/todo_item_create_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/cubit/todo_cubit.dart';

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
                todoItems = state.items.reversed.toList();
                return Expanded(
                  child: ListView.builder(
                    itemCount: todoItems.length,
                    itemBuilder: (ctx, index) => TodoListItemWidget(
                      title: todoItems[index].title,
                      subtitle: todoItems[index].text,
                      onTap: () => navigateToItem(
                        TodoItemDto(
                          id: todoItems[index].id,
                          title: todoItems[index].title,
                          text: todoItems[index].text,
                        ),
                      ),
                      onDelete: () => deleteItem(context, todoItems[index].id),
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
          extra: TodoItemCreateScreenArgs(
            itemDto: TodoItemDto(id: todoItems.length + 2),
          ).toMap(),
        ),
        child: const Icon(Icons.add),
      ),
    );
  }

  void navigateToItem(TodoItemDto itemDto) {
    AppRouter.router.push(
      AppRouter.todoCreateScreen,
      extra: TodoItemCreateScreenArgs(itemDto: itemDto).toMap(),
    );
  }

  void deleteItem(BuildContext context, int id) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        content: const Text('Are you sure you want to delete the note?'),
        actions: [
          TextButton(
            onPressed: () => AppRouter.router.pop(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              BlocProvider.of<TodoCubit>(context).deleteTodo(id);
              AppRouter.router.pop();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}

class TodoListItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const TodoListItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onDelete,
      child: Column(
        children: [
          Row(
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
          const Divider(),
        ],
      ),
    );
  }
}
