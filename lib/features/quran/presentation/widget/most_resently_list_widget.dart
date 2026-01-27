import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/features/quran/presentation/manager/most_recently_provider.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/quran/presentation/view/sura_detalis_view.dart';
import 'package:islami_app/features/quran/presentation/widget/shard_prefs.dart';
import 'package:islami_app/features/quran/presentation/widget/sura_container_widget.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
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
                return InkWell(
                  onTap: () {
                    addMostRecently(provider.mostRecentlyList[index]);
                    Navigator.pushNamed(
                      context,
                      SuraDetails.routeName,
                      arguments: provider.mostRecentlyList[index],
                    );
                  },
                  child: SuraContainer(
                    engSuraName:
                        QuranResources.englishQuranSurahsLidt[provider
                            .mostRecentlyList[index]],
                    arSuraName: QuranResources
                        .arabicAuranSurasList[provider.mostRecentlyList[index]],
                    num: QuranResources
                        .AyaNumberList[provider.mostRecentlyList[index]],
                  ),
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
