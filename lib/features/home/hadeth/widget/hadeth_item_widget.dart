import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/models/hadeth_model.dart';
import 'package:islami_app/core/themes/app_colors.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class HadethItem extends StatefulWidget {
  HadethItem({super.key, required this.hadithIndex});
  final int hadithIndex;

  @override
  State<HadethItem> createState() => _HadethItemState();
}

class _HadethItemState extends State<HadethItem> {
  HadethModel? hadeth;
  @override
  void initState() {
    super.initState();
    loadingHadith(widget.hadithIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: context.height * 0.02,
      
      ),
      // height: context.height * 0.75,
      width: context.width * 0.7,
      decoration: BoxDecoration(
        color: AppColors.goldColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: context.width * 0.015,
              right: context.width * 0.015,
              top: context.height * 0.01,
            ),
            width: double.infinity,
            height: context.height * 0.1,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Image.asset(
                    AppImages.cornerL,
                    color: AppColors.blackColor,
                    width: context.width * 0.16,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(hadeth?.title ?? '', style: AppStyle.bold18Black),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Image.asset(
                    AppImages.cornerR,
                    color: AppColors.blackColor,
                    width: context.width * 0.16,
                  ),
                ),
              ],
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
          Align(
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.hadethBg,
              height: context.height * 0.60,
              width: context.width * 0.45,
            ),
          ),
          Positioned.fill(
            top: context.height * 0.09,
            bottom: context.height * 0.12, 
            child: hadeth == null
                ? Center(
                    child: CircularProgressIndicator(
                      color: AppColors.blackColor,
                    ),
                  )
                : Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: context.width * 0.06,
                    ),
                    child: SingleChildScrollView(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        hadeth!.content,
                        textDirection: TextDirection.rtl,
                        textAlign: TextAlign.center,
                        style: AppStyle.bold16White.copyWith(
                          color: AppColors.blackColor,
                          fontSize: 15,
                          fontFamily: 'Janna',
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }

  void loadingHadith(int index) async {
    String fileContent = await rootBundle.loadString(
      "assets/files/Hadeeth/h$index.txt",
    );
    int fileLineIndex = fileContent.indexOf('\n');
    String title = fileContent.substring(0, fileLineIndex);
    String content = fileContent.substring(fileLineIndex + 1);
    hadeth = HadethModel(title: title, content: content);
    setState(() {});
  }
}
