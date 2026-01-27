import 'package:flutter/material.dart';
import 'package:islami_app/features/time/presentation/manager/azkar_provider.dart';
import 'package:islami_app/features/introduction/presentation/manager/shared_pref_helper.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/features/quran/presentation/manager/most_recently_provider.dart';
import 'package:islami_app/features/time/presentation/manager/time_provider.dart';
import 'package:islami_app/config/themes/app_themes.dart';

import 'package:islami_app/features/home/presentation/view/home_view.dart';
import 'package:islami_app/features/quran/presentation/view/quran_view.dart';
import 'package:islami_app/features/quran/presentation/view/sura_detalis_view.dart';
import 'package:islami_app/features/introduction/presentation/view/on_boarding_view.dart';
import 'package:islami_app/features/splash/Presentation/view/splash_view.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final bool isOnBoardingSeen =
      await SharedPrefHelper.isOnBoardingSeen();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MostRecentlyProvider()),
        ChangeNotifierProvider(
          create: (_) => TimeProvider()..loadPrayTime(),
        ),
        ChangeNotifierProvider(
          create: (_) => AzkarProvider(),
        ),
      ],
      child: IslamiApp(isOnBoardingSeen: isOnBoardingSeen),
    ),
  );
}

class IslamiApp extends StatelessWidget {
  final bool isOnBoardingSeen;

  const IslamiApp({super.key, required this.isOnBoardingSeen});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppThemes.themeData,
      initialRoute: SplashView.routeName,
      routes: {
        SplashView.routeName: (_) => SplashView(),
        OnBoardingView.routeName: (_) => const OnBoardingView(),
        HomeView.routeName: (_) => HomeView(),
        QuranView.routeName: (_) => QuranView(),
        SuraDetails.routeName: (_) => SuraDetails(),
      },
    );
  }
}
