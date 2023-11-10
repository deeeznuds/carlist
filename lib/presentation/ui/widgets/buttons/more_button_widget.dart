import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class MoreButtonWidget extends StatelessWidget {
  final VoidCallback onTap;

  const MoreButtonWidget(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 32,
      height: 32,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: AppColors.borderLight,
          child: InkWell(
            onTap: onTap,
            child:
                const Icon(Icons.more_horiz, color: AppColors.black, size: 18),
          ),
        ),
      ),
    );
  }
}
