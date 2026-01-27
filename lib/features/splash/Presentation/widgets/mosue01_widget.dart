import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/utils/app_images.dart';

class Mosqe01Widget extends StatelessWidget {
  const Mosqe01Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      width: 240,
      child: Image.asset(
        AppImages.mosque01,
        height: context.height * 0.3,
        width: context.width * 0.01,
      ),
    );
  }
}
