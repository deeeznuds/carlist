import 'package:carlist/data/models/todo_item_model.dart';
import 'package:flutter/material.dart';

import '../screens/todo_item_create_screen.dart';
import '../screens/todo_items_list_screen.dart';

class AppRouter {
  Route? onGeneratedRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (context) => const ToDoItemsListScreen(),
        );
      case '/create':
        return MaterialPageRoute(
          builder: (context) => const ToDoItemCreateScreen(),
          settings: const RouteSettings(arguments: TodoItemDto),
        );
      default:
        return null;
    }
  }
}
