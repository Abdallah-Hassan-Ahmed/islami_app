import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SuraContainer extends StatelessWidget {
  const SuraContainer({
    super.key,
    required this.engSuraName,
    required this.arSuraName,
    required this.num,
  });

  final String engSuraName;
  final String arSuraName;
  final String num;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: context.width * 0.02,
        top: context.height * 0.01,
        bottom: context.height * 0.01,
      ),
      width: context.width * 0.63,
      height: context.height * 0.18,
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
              Text(engSuraName, style: AppStyle.bold20Black),
              Text(arSuraName, style: AppStyle.bold20Black),
              Text("$num Verses", style: AppStyle.bold12Black),
            ],
          ),
          Image.asset(
            AppImages.reading,
            color: AppColors.blackColor,
            height: context.height * 0.14,
            width: context.width * 0.28,
          ),
        ],
      ),
    );
  }
}
