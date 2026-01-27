import 'package:flutter/material.dart';
import 'package:islami_app/core/providers/azkar_provider.dart';
import 'package:islami_app/features/introduction/presentation/widgets/shared_pref_helper.dart';
import 'package:provider/provider.dart';

import 'package:islami_app/core/providers/most_recently_provider.dart';
import 'package:islami_app/core/providers/time_provider.dart';
import 'package:islami_app/core/themes/app_themes.dart';

import 'package:islami_app/features/home/home_view.dart';
import 'package:islami_app/features/home/quran/quran_view.dart';
import 'package:islami_app/features/home/quran/sura_detalis_view.dart';
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
