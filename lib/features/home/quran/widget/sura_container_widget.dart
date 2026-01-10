import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SuraContainer extends StatelessWidget {
  const SuraContainer({super.key});

  get height => null;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.width * 0.03,
        top: context.height * 0.02,
        bottom: context.height * 0.02,
      ),
      width: context.width * 0.60,
      height: context.height * 0.16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.goldColor,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Al-Anbiya", style: AppStyle.bold20Black),
              Text("الأنبياء", style: AppStyle.bold20Black),
              Text("112 Verses  ", style: AppStyle.bold12Black),
            ],
          ),
          Image.asset(
            AppImages.reading,
            color: AppColors.blackColor,
            height: context.height * 0.14,
            width: context.width * 0.30,
          ),
        ],
      ),
    );
  }
}
