import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/home/quran/widget/most_resently_list_widget.dart';
import 'package:islami_app/features/home/quran/widget/sura_name_search_widget.dart';
import 'package:islami_app/features/home/quran/widget/sure_list.dart';

class QuranView extends StatelessWidget {
  const QuranView({super.key});
  static const routeName = "quranView";

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SuraNameWidget(),
          SizedBox(height: context.height * 0.02),
          Text("Most Recently", style: AppStyle.bold16White),
          SizedBox(height: context.height * 0.01),
          MostRecentlyList(),
          SizedBox(height: context.height * 0.02),
          Text("Suras List", style: AppStyle.bold16White),
          SizedBox(height: context.height * 0.02),
          Expanded(child: SureList()),
        ],
      ),
    );
  }
}
