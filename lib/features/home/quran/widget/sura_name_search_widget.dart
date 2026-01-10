import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SuraNameWidget extends StatelessWidget {
  const SuraNameWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
            style: AppStyle.bold16White,
            cursorColor: AppColors.goldColor,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.goldColor, width: 1.5),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColors.goldColor, width: 1.5),
              ),
              prefixIcon: ImageIcon(
                AssetImage(AppImages.icQuran),
                color: AppColors.goldColor,
              ),
              hintText: "Sura Name",
              hintStyle: AppStyle.bold16White,
            ),
          );
  }
}