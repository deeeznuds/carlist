import 'package:carlist/cubit/todo_cubit.dart';
import 'package:carlist/screens/todo_item_create_screen.dart';
import 'package:carlist/screens/todo_items_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(),
      child: MaterialApp(
        title: 'CarList',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        routes: {
          '/': (context) => const ToDoItemsListScreen(),
          '/create': (context) => const ToDoItemCreateScreen(),
        },
      ),
    );
  }
}
