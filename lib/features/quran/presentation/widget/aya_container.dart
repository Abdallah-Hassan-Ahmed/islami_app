import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_style.dart';

class AyahContainer extends StatelessWidget {
  const AyahContainer({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
    required this.onLongPress,
  });

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.goldColor.withOpacity(0.15)
              : const Color(0xFF1C1C1C),
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.goldColor,
            width: 1.2,
          ),
        ),
        child: Text(
          text,
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.center,
          style: AppStyle.bold20Gold,
        ),
      ),
    );
  }
}