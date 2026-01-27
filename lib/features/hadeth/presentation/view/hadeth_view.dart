import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/features/hadeth/presentation/widget/hadeth_item_widget.dart';

class HadethView extends StatelessWidget {
  const HadethView({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: context.height * 0.9,
        enlargeCenterPage: true,
        viewportFraction: 0.73,
      ),
      items: List.generate(50, (index) => index + 1).map((i) {
        return Builder(
          builder: (BuildContext context) {
            return HadethItem(hadithIndex: i);
          },
        );
      }).toList(),
    );
  }
}
