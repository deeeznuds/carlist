import 'package:flutter/material.dart';

class ToDoItemCreateScreen extends StatelessWidget {
  const ToDoItemCreateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('New ToDo'),
      ),
      body: const Column(
        children: [
          TextField(),
        ],
      ),
    );
  }
}
