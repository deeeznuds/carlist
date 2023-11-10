import 'package:carlist/constants/ui_sizes.dart';
import 'package:flutter/material.dart';

class CardItemWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const CardItemWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onDelete,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(UiSizes.largeBorderRadius),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title),
                      Text(subtitle),
                    ],
                  ),
                ),
                const Icon(Icons.arrow_circle_right),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
