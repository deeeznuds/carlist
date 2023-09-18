import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'logic/cubit/todo_cubit.dart';
import 'presentation/router/app_router.dart';

void main() {
  runApp(Main(connectivity: Connectivity()));
}

class Main extends StatelessWidget {
  final Connectivity connectivity;
  const Main({
    super.key,
    required this.connectivity,
  });

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TodoCubit>(
          create: (context) => TodoCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'CarList',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
          useMaterial3: true,
        ),
        onGenerateRoute: AppRouter().onGeneratedRoute,
      ),
    );
  }
}
