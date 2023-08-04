import 'package:carlist/constants/enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/cubit/internet_cubit.dart';
import '../../logic/cubit/todo_cubit.dart';

class ToDoItemsListScreen extends StatelessWidget {
  const ToDoItemsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<InternetCubit, InternetState>(
      listener: (context, state) {
        if (state is InternetConnected &&
            state.connectionType == ConnectionType.wifi) {
          BlocProvider.of<TodoCubit>(context).saveToDo('WIFI', '');
        } else if (state is InternetConnected &&
            state.connectionType == ConnectionType.mobile) {
          BlocProvider.of<TodoCubit>(context).saveToDo('MOBILE', '');
        } else if (state is InternetDisconnected) {
          BlocProvider.of<TodoCubit>(context).saveToDo('DISCONNECTED', '');
        }
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('ToDo List'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<TodoCubit, TodoState>(
                builder: (context, state) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: 1,
                      itemBuilder: (ctx, index) => ToDoListItemWidget(
                        title: state.title,
                        subtitle: state.text,
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ToDoListItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;

  const ToDoListItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushNamed('/create'),
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

class ToDoListItem {
  final String title;
  final String subtitle;

  ToDoListItem({
    required this.title,
    required this.subtitle,
  });
}
