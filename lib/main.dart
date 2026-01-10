import 'package:flutter/material.dart';
import 'package:islami_app/core/themes/app_themes.dart';
import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/home/quran/quran_view.dart';
import 'package:islami_app/features/home/quran/sura_detalis_view.dart';
import 'package:islami_app/features/introduction/presentation/view/on_boarding_view.dart';
import 'package:islami_app/features/splash/Presentation/view/splash_view.dart';

void main() {
  runApp(const IslamiApp());
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        OnBoardingView.routeName: (context) => OnBoardingView(),
        QuranView.routeName: (context) => QuranView(),
        HomeView.routeName:(context)=> HomeView(),
        SuraDetails.routeName:(context)=> SuraDetails()
      },
    );
  }
}
