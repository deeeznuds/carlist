import 'package:carlist/data/models/todo_item_model.dart';
import 'package:go_router/go_router.dart';

import '../screens/todo_item_create_screen.dart';
import '../screens/todo_items_list_screen.dart';

class AppRouter {
  static const String todoCreateScreen = '/create';

  static final router = GoRouter(
    initialLocation: '/',
    requestFocus: false,
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const TodoItemsListScreen(),
      ),
      GoRoute(
        path: todoCreateScreen,
        builder: (context, state) =>
            TodoItemCreateScreen(itemDto: state.extra as TodoItemDto),
      ),
    ],
  );
}
