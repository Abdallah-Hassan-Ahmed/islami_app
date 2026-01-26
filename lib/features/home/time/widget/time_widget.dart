import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/home/time/widget/slider_widgrt.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.height * 0.35,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.brawnColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Stack(
        children: [
          Image.asset(
            AppImages.timeBG,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.01),
              child: Text(
                "Pray Time",
                style: AppStyle.bold20Black.copyWith(
                  color: AppColors.blackColor.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: EdgeInsets.only(top: context.height * 0.055),
              child: Text(
                "Tuesday",
                style: AppStyle.bold20Black.copyWith(
                  color: AppColors.blackColor.withOpacity(0.9),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: context.width * 0.06,
            right: 0,
            left: 0,
            child: Column(
              children: [
                SliderWidget(),
                SizedBox(height: context.height * 0.03),
                Text(
                  "Next Pray - 02:32",
                  style: AppStyle.bold16BlackJJ.copyWith(
                    color: AppColors.blackColor.withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
