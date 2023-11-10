import 'package:carlist/constants/ui_sizes.dart';
import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class BackBtn extends StatelessWidget {
  final VoidCallback onTap;

  const BackBtn(this.onTap, {super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(UiSizes.smallBorderRadius),
        child: Material(
          color: AppColors.borderLight,
          child: InkWell(
            onTap: onTap,
            child: const Icon(Icons.arrow_back_ios_new_rounded, size: 18),
          ),
        ),
      ),
    );
  }
}
