import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/features/home/time/widget/pray_time_container.dart';

class SliderWidget extends StatelessWidget {
  const SliderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: context.height * 0.14,
        enlargeCenterPage: true,
        viewportFraction: 0.3,
      ),
      items: List.generate(11, (index) => index + 1).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return PrayContainer();
          },
        );
      }).toList(),
    );
  }
}
