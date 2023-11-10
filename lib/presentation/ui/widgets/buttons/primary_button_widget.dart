import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class PrimaryButtonWidget extends StatelessWidget {
  final String label;
  final VoidCallback onTap;
  final EdgeInsets margin;

  const PrimaryButtonWidget({
    super.key,
    this.label = 'OK',
    required this.onTap,
    this.margin = const EdgeInsets.only(top: 15, bottom: 30),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: margin,
      decoration: BoxDecoration(
        gradient: AppColors.primaryGradient,
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF95ADFE).withOpacity(0.3),
            blurRadius: 22,
            offset: const Offset(0, 10),
          ),
        ],
        borderRadius: BorderRadius.circular(99),
      ),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          foregroundColor: AppColors.white,
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
          surfaceTintColor: Colors.transparent,
          fixedSize: const Size(double.infinity, 50),
          padding: EdgeInsets.zero,
        ),
        child: Text(
          label,
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
