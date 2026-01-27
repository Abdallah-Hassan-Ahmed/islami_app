import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_style.dart';

class SuraNameWidget extends StatelessWidget {
  const SuraNameWidget({super.key, required this.onSearch});

  final Function(List<int>  , String) onSearch;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (newText) {
        List<int> filterList = [];

        for (var i = 0;
            i < QuranResources.englishQuranSurahsLidt.length;
            i++) {
          if (QuranResources.englishQuranSurahsLidt[i]
                  .toLowerCase()
                  .contains(newText.toLowerCase()) ||
              QuranResources.arabicAuranSurasList[i].contains(newText)) {
            filterList.add(i);
          }
        }

        onSearch(filterList , newText);
      },
      style: AppStyle.bold16White,
      cursorColor: AppColors.goldColor,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.goldColor, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide:
              BorderSide(color: AppColors.goldColor, width: 1.5),
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
