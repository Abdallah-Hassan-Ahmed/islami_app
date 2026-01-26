import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';

class PrayContainer extends StatelessWidget {
  const PrayContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.width * 0.02),
      height: context.height * 0.19,
      width: context.width * 0.24,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [AppColors.blackColor, AppColors.brawnColor],
        ),
      ),
    );
  }
}
