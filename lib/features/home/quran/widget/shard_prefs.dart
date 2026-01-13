import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String mostRecentlyKey = 'most_recently_key';
}

void addMostRecently(int SuraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentlyList =
      prefs.getStringList(PrefsKeys.mostRecentlyKey) ?? [];

  if (mostRecentlyList.contains("$SuraIndex")) {
    mostRecentlyList.remove('$SuraIndex');
    mostRecentlyList.insert(0, '$SuraIndex');
  } else {
    mostRecentlyList.insert(0, "$SuraIndex");
  }
  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }
  prefs.setStringList(PrefsKeys.mostRecentlyKey, mostRecentlyList);
}


