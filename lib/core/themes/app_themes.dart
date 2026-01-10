import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';

class AppThemes {
  static final ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.transparentColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.black,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.goldColor,
      
    ),
    textTheme: TextTheme(
      headlineSmall: AppStyle.bold16White,
    )
  );
}
