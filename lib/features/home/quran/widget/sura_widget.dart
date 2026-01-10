import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SuraWidget extends StatelessWidget {
  const SuraWidget({super.key, required this.num});
  final int num;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: context.height * 0.06,
          child: Row(
            children: [
              Stack(
                alignment: AlignmentGeometry.center,
                children: [
                  Image.asset(AppImages.icSuraNumber),
                  Text(
                    "${num + 1}",
                    style: AppStyle.bold16White.copyWith(fontSize: 11),
                  ),
                ],
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: context.width * 0.04),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        QuranResources.englishQuranSurahsLidt[num],
                        style: AppStyle.bold20White.copyWith(fontSize: 16),
                      ),
                      Text(
                        "${QuranResources.AyaNumberList[num]} Verses",
                        style: AppStyle.bold12Black.copyWith(
                          color: AppColors.whiteColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                QuranResources.arabicAuranSurasList[num],
                style: AppStyle.bold20White.copyWith(fontSize: 18),
              ),
            ],
          ),
        ),
        SizedBox(height: context.height * 0.01),
        Divider(
          color: AppColors.whiteColor,
          indent: context.width * 0.10,
          endIndent: context.width * 0.10,
        ),
      ],
    );
  }
}
