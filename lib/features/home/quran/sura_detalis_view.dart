import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SuraDetails extends StatelessWidget {
  const SuraDetails({super.key});
  static const String routeName = 'suraDetails';

  // final String suraNameEn;
  // final String suraNameAr;

  @override
  Widget build(BuildContext context) {
    var num = ModalRoute.of(context)!.settings.arguments as int ;
    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBar(
        backgroundColor: AppColors.transparentColor,
        leading: Padding(
          padding: EdgeInsets.only(left: context.width * 0.07),
          child: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(Icons.arrow_back, color: AppColors.goldColor),
          ),
        ),
        centerTitle: true,
        title: Text(
          QuranResources.englishQuranSurahsLidt[num-1],
          style: AppStyle.bold20Black.copyWith(color: AppColors.goldColor),
        ),
      ),

      body:SizedBox.expand(
        child: Stack(
          children: [],
        ),
      ) ,  
    );
  }
}
