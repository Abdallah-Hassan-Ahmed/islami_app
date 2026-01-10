import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/home/quran/widget/Iislami_widget.dart';

class AllOnBoardingBodyWidget extends StatelessWidget {
  const AllOnBoardingBodyWidget({
    super.key,
    required this.image,
    required this.text,
    this.supText,
    this.supText2,
  });

  final String image;
  final String text;
  final String? supText;
  final String? supText2;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(context.height * 0.017),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          IslamiWidget(),
          SizedBox(
            height: supText == null
                ? context.height * 0.04
                : context.height * 0.01,
          ),
          Image.asset(
            image,
            height: context.height * 0.35,
            width: double.infinity,
          ),
          SizedBox(
            height: supText == null
                ? context.height * 0.04
                : context.height * 0.02,
          ),
          Center(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.goldColor,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (supText != null) ...[
            SizedBox(height: context.height * 0.02),
            supText2 == null
                ? Center(
                    child: Text(
                      supText!,
                      style: TextStyle(
                        color: AppColors.goldColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  )
                : Column(
                    children: [
                      Text(
                        supText!,
                        style: AppStyle.bold16White.copyWith(
                          color: AppColors.goldColor,
                        ),
                      ),
                      Text(
                        supText2!,
                        style: AppStyle.bold16White.copyWith(
                          color: AppColors.goldColor,
                        ),
                      ),
                    ],
                  ),
          ],
        ],
      ),
    );
  }
}
