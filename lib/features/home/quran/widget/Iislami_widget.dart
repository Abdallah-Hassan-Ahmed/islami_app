import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/features/splash/Presentation/widgets/mosue01_widget.dart';

class IslamiWidget extends StatelessWidget {
  const IslamiWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: context.height * 0.042),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Mosqe01Widget(),
          Padding(
            padding: const EdgeInsets.only(top: 38.0),
            child: Image.asset(
              AppImages.islami,
              color: AppColors.goldColor,
              height: context.height * 0.05,
              width: context.width * 0.38,
            ),
          ),
        ],
      ),
    );
  }
}
