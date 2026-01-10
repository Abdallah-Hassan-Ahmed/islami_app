import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_images.dart';
import 'package:islami_app/features/home/hadeth/hadeth_view.dart';
import 'package:islami_app/features/home/quran/quran_view.dart';
import 'package:islami_app/features/home/quran/widget/Iislami_widget.dart';
import 'package:islami_app/features/home/quran/widget/background_quran_widget.dart';
import 'package:islami_app/features/home/radio/radio_view.dart';
import 'package:islami_app/features/home/sepha/sepha_view.dart';
import 'package:islami_app/features/home/time/time_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  static const String routeName = 'hamo';

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;
  List<Widget> bodyTabs = [
    QuranView(),
    HadethView(),
    SephaView(),
    RadioView(),
    TimeView(),
  ];
  List<Widget> backgroundImage = [
    BackgroundWidget(imageBg: AppImages.quranBg),
    BackgroundWidget(imageBg: AppImages.hadithBg),
    BackgroundWidget(imageBg: AppImages.sebhaBg),
    BackgroundWidget(imageBg: AppImages.radioBg),
    BackgroundWidget(imageBg: AppImages.timeBg),
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        backgroundImage[selectedIndex],
        Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            items: [
              BottomNavigationBarItem(
                icon: navIcon(AppImages.icQuran, selectedIndex == 0),
                label: 'Quran',
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppImages.icHadith, selectedIndex == 1),
                label: 'Hadith',
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppImages.icSebha, selectedIndex == 2),
                label: 'Sebha',
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppImages.icRadio, selectedIndex == 3),
                label: 'Radio',
              ),
              BottomNavigationBarItem(
                icon: navIcon(AppImages.icTime, selectedIndex == 4),
                label: 'Time',
              ),
            ],
          ),
          body: Column(
            children: [
              IslamiWidget(),
              Expanded(child: bodyTabs[selectedIndex]),
            ],
          ),
        ),
      ],
    );
  }

  Widget navIcon(String icImage, bool isSelected) {
    return isSelected
        ? Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(66),
              color: const Color.fromRGBO(32, 32, 32, 0.6),
            ),
            alignment: Alignment.center,
            child: ImageIcon(AssetImage(icImage), color: Colors.white),
          )
        : ImageIcon(AssetImage(icImage), color: Colors.black);
  }
}
