import 'package:flutter/material.dart';
import 'package:islami_app/core/utils/app_images.dart';
import 'package:islami_app/features/hadeth/presentation/view/hadeth_view.dart';
import 'package:islami_app/features/quran/presentation/view/quran_view.dart';
import 'package:islami_app/features/quran/presentation/widget/Iislami_widget.dart';
import 'package:islami_app/features/quran/presentation/widget/background_quran_widget.dart';
import 'package:islami_app/features/radio/presentation/view/radio_view.dart';
import 'package:islami_app/features/sepha/presentation/view/sepha_view.dart';
import 'package:islami_app/features/time/presentation/view/time_view.dart';

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
