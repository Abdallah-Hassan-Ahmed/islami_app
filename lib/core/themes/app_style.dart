import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_colors.dart';

class AppStyle {
  static TextStyle bold16White = TextStyle(
    color: Color(0xffFEFFE8),
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold20Black = TextStyle(
    color: AppColors.blackColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold20White = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold20Gold = TextStyle(
    color: AppColors.goldColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold12Black = TextStyle(
    color: AppColors.blackColor,
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );
  static TextStyle bold18Black = TextStyle(
    color: AppColors.blackColor,
    fontSize: 18,
    fontWeight: FontWeight.w700,
    fontFamily: 'Janna',
  );
  static TextStyle bold36White = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 26,
    fontWeight: FontWeight.w700,
    fontFamily: 'Janna',
  );
}
