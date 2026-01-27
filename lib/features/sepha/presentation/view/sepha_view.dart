import 'package:flutter/material.dart';
import 'package:islami_app/core/extention/media_query_extention.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/core/utils/app_style.dart';
import 'package:islami_app/features/sepha/presentation/manager/sepha_pref_helper.dart';

class SephaView extends StatefulWidget {
  const SephaView({super.key});

  @override
  State<SephaView> createState() => _SephaViewState();
}

class _SephaViewState extends State<SephaView> {
  int counter = 0;
  double turns = 0;
  int next = 0;

  final List<String> azkar = [
    'سبحان الله',
    'الحمد لله',
    'لا اله الا الله',
    'الله اكبر',
  ];

  @override
  void initState() {
    super.initState();
    _loadSaved();
  }

  Future<void> _loadSaved() async {
    final data = await SephaPrefHelper.load();
    setState(() {
      counter = data['counter'];
      turns = data['turns'];
      next = data['next'];
    });
  }

  Future<void> _onTap() async {
    counter++;

    if (counter > 132) {
      counter = 0;
      turns = 0;
      next = 0;
    } else {
      next = ((counter - 1) ~/ 33) % azkar.length;
      turns += (1 / 30);
    }

    await SephaPrefHelper.save(counter: counter, turns: turns, next: next);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTap,
      child: SizedBox.expand(
        child: Column(
          children: [
            Text("سَبِّحِ اسْمَ رَبِّكَ الأعلى", style: AppStyle.bold36White),
            SizedBox(height: context.height * 0.02),

            Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 0,
                  child: Container(
                    margin: EdgeInsets.only(left: context.width * 0.12),
                    child: Image.asset(
                      AppImages.maskSepha,
                      height: context.height * 0.1,
                    ),
                  ),
                ),

                Container(
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

                Container(
                  margin: EdgeInsets.only(top: context.height * 0.1),
                  child: Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          azkar[next],
                          style: AppStyle.bold36White,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: context.height * 0.025),
                        Text("$counter", style: AppStyle.bold36White),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
