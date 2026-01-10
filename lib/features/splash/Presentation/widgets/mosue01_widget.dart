import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_images.dart';

class Mosqe01Widget extends StatelessWidget {
  const Mosqe01Widget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 157,
      width: 291,
      child: Image.asset(AppImages.mosque01),
    );
  }
}
