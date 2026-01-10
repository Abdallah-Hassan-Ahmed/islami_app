import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/features/home/quran/sura_detalis_view.dart';
import 'package:islami_app/features/home/quran/widget/sura_widget.dart';

class SureList extends StatelessWidget {
  SureList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.pushNamed(context, SuraDetails.routeName , arguments: index+1);
          },
          child: SuraWidget(num: index,));
      },
      itemCount: QuranResources.AyaNumberList.length,
      separatorBuilder: (context, index) =>
          SizedBox(height: context.height * 0.01),
    );
  }
}
