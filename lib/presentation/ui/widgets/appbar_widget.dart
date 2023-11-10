import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/widgets/buttons/back_button_widget.dart';
import 'package:carlist/presentation/ui/widgets/buttons/more_button_widget.dart';
import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final bool backEnabled;
  final String? title;
  final List<Widget>? actions;
  final VoidCallback? moreAction;

  const AppBarWidget({
    super.key,
    this.backEnabled = true,
    this.title,
    this.actions,
    this.moreAction,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: AppBar(
        leading: backEnabled ? BackBtn(_onBack) : null,
        leadingWidth: 32,
        title: title != null
            ? Text(
                title!,
                style: Theme.of(context).textTheme.titleLarge,
              )
            : null,
        actions: _getActions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);

  List<Widget>? get _getActions =>
      moreAction != null ? [MoreButtonWidget(() {})] : actions;

  void _onBack() {
    AppRouter.router.pop();
  }
}
