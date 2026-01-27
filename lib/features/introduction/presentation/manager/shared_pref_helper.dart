import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  static const String onBoardingKey = 'onBoardingSeen';

  static Future<void> setOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onBoardingKey, true);
  }

  static Future<bool> isOnBoardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onBoardingKey) ?? false;
  }
}
