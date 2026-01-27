import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/features/time/presentation/widget/pray_time_container.dart';

class SliderWidget extends StatelessWidget {
  final List<Map<String, String>> items;

  const SliderWidget({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
  options: CarouselOptions(
    height: context.height * 0.17,
    enlargeCenterPage: true,
    viewportFraction: 0.32,
    enlargeFactor: 0.2,
  ),
  items: items.map((item) {
    return PrayContainer(
      name: item['name']!,
      time: item['time']!,
      period: item['period']!,
    );
  }).toList(),
);

  }
}
