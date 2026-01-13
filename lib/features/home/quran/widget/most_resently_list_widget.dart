import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/providers/most_recently_provider.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/home/quran/widget/shard_prefs.dart';
import 'package:islami_app/features/home/quran/widget/sura_container_widget.dart';
import 'package:provider/provider.dart';

class MostRecentlyList extends StatefulWidget {
  MostRecentlyList({super.key});

  @override
  State<MostRecentlyList> createState() => _MostRecentlyListState();
}

class _MostRecentlyListState extends State<MostRecentlyList> {
  late MostRecentlyProvider provider;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPersistentFrameCallback((_) {
      provider.refreshMostRecently();
    });
    
  }

  @override
  Widget build(BuildContext context) {
    provider = Provider.of<MostRecentlyProvider>(context);
    return Visibility(
      visible: provider.mostRecentlyList.isNotEmpty,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: context.height * 0.02),

          Text("Most Recently", style: AppStyle.bold16White),
          SizedBox(height: context.height * 0.01),
          SizedBox(
            height: context.height * 0.16,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return SuraContainer(
                  engSuraName: QuranResources
                      .englishQuranSurahsLidt[provider.mostRecentlyList[index]],
                  arSuraName: QuranResources
                      .arabicAuranSurasList[provider.mostRecentlyList[index]],
                  num: QuranResources
                      .AyaNumberList[provider.mostRecentlyList[index]],
                );
              },
              separatorBuilder: (context, index) {
                return SizedBox(width: context.width * 0.023);
              },
              itemCount: provider.mostRecentlyList.length,
            ),
          ),
        ],
      ),
    );
  }
}
