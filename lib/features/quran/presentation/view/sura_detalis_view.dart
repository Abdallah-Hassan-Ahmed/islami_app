import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/utils/app_colors.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/quran/presentation/widget/app_bar_widget.dart';
import 'package:islami_app/features/quran/presentation/widget/aya_container.dart';
import 'package:islami_app/features/quran/presentation/widget/shard_prefs.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';


class SuraDetails extends StatefulWidget {
  const SuraDetails({super.key});
  static const String routeName = 'suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  List<String> suraVerses = [];

  int? lastSura;
  int? lastAya;

  final ItemScrollController _itemScrollController = ItemScrollController();

  @override
  Widget build(BuildContext context) {
    final int suraIndex =
        ModalRoute.of(context)!.settings.arguments as int;

    if (suraVerses.isEmpty) {
      loadSura(suraIndex);
    }

    if (lastSura == null && lastAya == null) {
      loadLastRead(suraIndex);
    }

    return Scaffold(
      backgroundColor: AppColors.blackColor,
      appBar: AppBarWidget(
        text: QuranResources.englishQuranSurahsLidt,
        number: suraIndex,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
            height: context.height * 0.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(AppImages.cornerL),
                Text(
                  QuranResources.arabicAuranSurasList[suraIndex],
                  style: AppStyle.bold20Gold,
                ),
                Image.asset(AppImages.cornerR),
              ],
            ),
          ),

          Expanded(
            child: suraVerses.isEmpty
                ?  Center(
                    child: CircularProgressIndicator(
                      color: AppColors.goldColor,
                    ),
                  )
                : ScrollablePositionedList.builder(
                    itemScrollController: _itemScrollController,
                    padding: EdgeInsets.symmetric(
                      horizontal: context.width * 0.06,
                      vertical: 12,
                    ),
                    itemCount: suraVerses.length,
                    itemBuilder: (context, index) {
                      bool isLast =
                          (lastSura == suraIndex && lastAya == index + 1);

                      return AyahContainer(
                        text: '${suraVerses[index]} (${index + 1})',
                        isSelected: isLast,
                        onTap: () {
                          saveLastRead(suraIndex, index + 1);
                          setState(() {
                            lastSura = suraIndex;
                            lastAya = index + 1;
                          });
                        },
                        onLongPress: () {
                          Clipboard.setData(
                            ClipboardData(
                              text:
                                  '${suraVerses[index]} (${QuranResources.arabicAuranSurasList[suraIndex]} : ${index + 1})',
                            ),
                          );

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('تم نسخ الآية'),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),

          SafeArea(
            child: SizedBox(
              height: context.height * 0.12,
              child: Image.asset(
                AppImages.mosque02,
                fit: BoxFit.fill,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void loadSura(int index) async {
    String content =
        await rootBundle.loadString('assets/files/${index + 1}.txt');

    suraVerses = content.split('\n');
    setState(() {});
  }

  void loadLastRead(int currentSura) async {
    final data = await getLastRead();
    if (data != null) {
      lastSura = data['sura'];
      lastAya = data['aya'];

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (lastSura == currentSura && _itemScrollController.isAttached) {
          _itemScrollController.scrollTo(
            index: lastAya! - 1,
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut,
          );
        }
      });

      setState(() {});
    }
  }
}