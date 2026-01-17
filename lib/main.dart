import 'package:flutter/material.dart';
import 'package:islami_app/core/providers/most_recently_provider.dart';
import 'package:islami_app/core/themes/app_themes.dart';
import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/home/quran/quran_view.dart';
import 'package:islami_app/features/home/quran/sura_detalis_view.dart';
import 'package:islami_app/features/home/sepha/sepha_view.dart';
import 'package:islami_app/features/introduction/presentation/view/on_boarding_view.dart';
import 'package:islami_app/features/splash/Presentation/view/splash_view.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MostRecentlyProvider(),
      child: IslamiApp(),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  const IslamiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      initialRoute: HomeView.routeName,
      routes: {
        SplashView.routeName: (context) => SplashView(),
        OnBoardingView.routeName: (context) => OnBoardingView(),
        QuranView.routeName: (context) => QuranView(),
        HomeView.routeName: (context) => HomeView(),
        SuraDetails.routeName: (context) => SuraDetails(),
      },
    );
  }
}
