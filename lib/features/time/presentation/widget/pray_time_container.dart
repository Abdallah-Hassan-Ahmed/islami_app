import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_style.dart';

class PrayContainer extends StatelessWidget {
  final String name;
  final String time;
  final String period;

  const PrayContainer({
    super.key,
    required this.name,
    required this.time,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: context.width * 0.02),
      height: context.height * 0.16,
      width: context.width * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        gradient: LinearGradient(
          colors: [AppColors.blackColor, AppColors.brawnColor],
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,

        children: [
          Text(name, style: AppStyle.bold16WhiteJN),
          const SizedBox(height: 4),
          Text(time, style: AppStyle.bold16WhiteJN.copyWith(fontSize: 18)),
          Text(period, style: AppStyle.bold16WhiteJN),
        ],
      ),
    );
  }
}
