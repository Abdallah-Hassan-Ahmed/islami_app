import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/features/home/time/widget/azkar_widget.dart';

class AzkarList extends StatelessWidget {
  AzkarList({super.key});

  final List<Map<String, String>> items = [
    {'title': 'أذكار الصباح', 'key': 'أذكار الصباح'},
    {'title': 'أذكار المساء', 'key': 'أذكار المساء'},
    {'title': 'أذكار النوم', 'key': 'أذكار النوم'},
    {'title': 'أذكار الاستيقاظ', 'key': 'أذكار الاستيقاظ'},
  ];

  List<Image> image = [
    Image.asset(AppImages.azkarSop7),
    Image.asset(AppImages.azkarMsaa),
    Image.asset(AppImages.azkarNom),
    Image.asset(AppImages.azkarAstiqaz),
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.85,
      ),
      itemBuilder: (_, i) {
        return AzkarCard(image: image[i],title: items[i]['title']!, apiKey: items[i]['key']!);
      },
    );
  }
}
