import 'package:carlist/presentation/router/app_router.dart';
import 'package:carlist/presentation/ui/theme/colors.dart';
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
      leading: backEnabled ? _BackBtn(_onBack) : null,
      title: title != null
          ? Text(
              title!,
              style: Theme.of(context).textTheme.titleLarge,
            )
          : null,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);

  void _onBack() {
    AppRouter.router.pop();
  }
}

class _BackBtn extends StatelessWidget {
  final VoidCallback onTap;

  const _BackBtn(this.onTap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: AppColors.borderLight,
          child: InkWell(
            onTap: onTap,
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 16),
          ),
        ),
      ),
    );
  }
}
