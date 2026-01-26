import 'package:flutter/material.dart';
import 'package:islami_app/core/constants/const_data.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/core/themes/app_style.dart';

class SephaView extends StatefulWidget {
  SephaView({super.key});

  @override
  State<SephaView> createState() => _SephaViewState();
}

class _SephaViewState extends State<SephaView> {
  int counter = 0;
  double turns = 0;
  int next = 0;

  bool isDone = false;
  List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى ", style: AppStyle.bold36White),
          SizedBox(height: context.height * 0.02),
          SizedBox(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    margin: EdgeInsets.only(left: context.width * 0.12),
                    child: Image.asset(
                      AppImages.maskSepha,
                      height: context.height * 0.1,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    margin: EdgeInsets.only(top: context.height * 0.09),
                    child: AnimatedRotation(
                      turns: turns,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeOut,
                      child: Image.asset(
                        AppImages.bodySepha,
                        height: context.height * 0.45,
                        width: context.height * 0.45,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: GestureDetector(
                    onTap: () {
                      counter++;
                      
                      if (counter > 132) {
                        counter = 0;
                      }
                      
                      next = ((counter - 1) ~/ 33) % azkar.length;
                      turns += (1 / 30);
                      setState(() {});
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: context.height * 0.25),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(azkar[next], style: AppStyle.bold36White),
                          SizedBox(height: context.height * 0.02),
                          Text("$counter", style: AppStyle.bold36White),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
