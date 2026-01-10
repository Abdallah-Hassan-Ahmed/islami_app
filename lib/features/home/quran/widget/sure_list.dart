import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/features/home/quran/sura_detalis_view.dart';
import 'package:islami_app/features/home/quran/widget/sura_widget.dart';

class SureList extends StatelessWidget {
  const SureList({super.key, required this.filterIndex});

  final List<int> filterIndex;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: filterIndex.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              SuraDetails.routeName,
              arguments: filterIndex[index],
            );
          },
          child: SuraWidget(num: filterIndex[index]),
        );
      },
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.01),
    );
  }
}
