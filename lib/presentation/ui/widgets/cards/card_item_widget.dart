import 'package:carlist/constants/ui_sizes.dart';
import 'package:carlist/presentation/ui/theme/colors.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  const CardItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(UiSizes.largeBorderRadius),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1D242A).withOpacity(0.05),
            blurRadius: 40,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: AppColors.white,
        child: InkWell(
          onTap: onTap,
          onLongPress: onLongPress,
          child: Padding(
            padding: const EdgeInsets.all(UiSizes.defaultPadding),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    color: AppColors.grayLight,
                    shape: BoxShape.circle,
                  ),
                ),
                Flexible(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 3),
                        Text(
                          subtitle,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
                const RotatedBox(
                  quarterTurns: 2,
                  child: Icon(Icons.arrow_back_ios_new_rounded),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
