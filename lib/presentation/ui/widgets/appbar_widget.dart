import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool backEnabled;
  final String? title;
  final List<Widget>? actions;

  const AppBarWidget({
    super.key,
    this.backEnabled = true,
    this.title,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      leading: backEnabled ? const _BackBtn() : null,
      title: title != null ? Text(title!) : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _BackBtn extends StatelessWidget {
  const _BackBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
