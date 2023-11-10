import 'dart:convert';

import 'package:carlist/constants/ui_sizes.dart';
import 'package:carlist/presentation/ui/widgets/buttons/primary_button_widget.dart';
import 'package:carlist/presentation/ui/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:carlist/data/models/todo_item_model.dart';
import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/widgets/appbar_widget.dart';

import '../../logic/cubit/todo_cubit.dart';

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

  String title = '';
  String description = '';

  @override
  void initState() {
    super.initState();
    args = TodoItemCreateScreenArgs.fromMap(widget.args);
    title = args.itemDto.title;
    description = args.itemDto.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        title: 'New Todo',
        moreAction: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: UiSizes.horizontalPadding,
          vertical: UiSizes.verticalPadding,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                TextFieldWidget(
                  initialValue: title,
                  hintText: 'Title',
                  onChanged: (value) => title = value,
                ),
                const SizedBox(height: 15),
                TextFieldWidget(
                  initialValue: description,
                  hintText: 'Text',
                  maxLines: 10,
                  onChanged: (value) => description = value,
                ),
              ],
            ),
            PrimaryButtonWidget(
              label: 'Save',
              onTap: saveTodo,
              margin: const EdgeInsets.only(bottom: 15),
            ),
          ],
        ),
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
