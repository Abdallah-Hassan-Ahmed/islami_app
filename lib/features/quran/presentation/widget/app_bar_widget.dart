import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_style.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget{
  AppBarWidget({super.key, required this.text ,required this.number});
  

    int number = 10;
  final List<String> text;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      scrolledUnderElevation: 0,
      backgroundColor: AppColors.transparentColor,
      leading: Padding(
        padding: EdgeInsets.only(left: context.width * 0.05),
        child: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: AppColors.goldColor),
        ),
      ),
      centerTitle: true,
      title: Text(
        text[number],
        style: AppStyle.bold20Black.copyWith(color: AppColors.goldColor),
      ),
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
