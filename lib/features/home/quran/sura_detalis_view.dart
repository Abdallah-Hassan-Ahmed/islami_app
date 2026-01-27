import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/constants/quran_resources.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';
import 'package:islami_app/features/home/quran/widget/app_bar_widget.dart';

class SuraDetails extends StatefulWidget {
  SuraDetails({super.key});
  static const String routeName = 'suraDetails';

  @override
  State<SuraDetails> createState() => _SuraDetailsState();
}

class _SuraDetailsState extends State<SuraDetails> {
  String SuraContent = '';

  @override
  Widget build(BuildContext context) {
    var num = ModalRoute.of(context)!.settings.arguments as int;
    if (SuraContent.isEmpty) {
      loadingSura(num);
    }
    return Scaffold(
      backgroundColor: AppColors.blackColor,

      appBar: AppBarWidget(
        text: QuranResources.englishQuranSurahsLidt,
        number: num,
      ),
      body: SizedBox.expand(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: context.width * 0.04),
              width: double.infinity,
              height: context.height * 0.1,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(AppImages.cornerL),
                  Text(
                    QuranResources.arabicAuranSurasList[num],
                    style: AppStyle.bold20Black.copyWith(
                      color: AppColors.goldColor,
                    ),
                  ),
                  Image.asset(AppImages.cornerR),
                ],
              ),
            ),
            Expanded(
              child: SuraContent.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(
                        color: AppColors.goldColor,
                      ),
                    )
                  : Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: context.width * 0.06,
                      ),
                      child: SingleChildScrollView(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          SuraContent,
                          textDirection: TextDirection.rtl,
                          textAlign: TextAlign.center,
                          style: AppStyle.bold20Gold,
                        ),
                      ),
                    ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: SafeArea(
                child: SizedBox(
                  height: context.height * 0.12,
                  child: Image.asset(
                    AppImages.mosque02,
                    fit: BoxFit.fill,
                    height: double.infinity,
                    width: double.infinity,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loadingSura(int index) async {
    String contentSura = await rootBundle.loadString(
      'assets/files/${index + 1}.txt',
    );
    List<String> sura = contentSura.split("\n");
    for (var i = 0; i < sura.length; i++) {
      sura[i] = '${sura[i]}(${i + 1}) ';
    }
    SuraContent = sura.join();
    Future.delayed(Duration(seconds: 1), () => setState(() {}));
  }
}
