import 'package:shared_preferences/shared_preferences.dart';

class PrefsKeys {
  static const String mostRecentlyKey = 'most_recently_key';
  static const String lastSuraKey = 'last_sura';
  static const String lastAyaKey = 'last_aya';
}

/// Most Recently (زي ما كان)
void addMostRecently(int suraIndex) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> mostRecentlyList =
      prefs.getStringList(PrefsKeys.mostRecentlyKey) ?? [];

  if (mostRecentlyList.contains("$suraIndex")) {
    mostRecentlyList.remove('$suraIndex');
    mostRecentlyList.insert(0, '$suraIndex');
  } else {
    mostRecentlyList.insert(0, "$suraIndex");
  }

  if (mostRecentlyList.length > 5) {
    mostRecentlyList.removeLast();
  }

  prefs.setStringList(PrefsKeys.mostRecentlyKey, mostRecentlyList);
}

/// ⭐ حفظ آخر آية
Future<void> saveLastRead(int sura, int aya) async {
  final prefs = await SharedPreferences.getInstance();
  await prefs.setInt(PrefsKeys.lastSuraKey, sura);
  await prefs.setInt(PrefsKeys.lastAyaKey, aya);
}

/// ⭐ قراءة آخر آية محفوظة
Future<Map<String, int>?> getLastRead() async {
  final prefs = await SharedPreferences.getInstance();
  final sura = prefs.getInt(PrefsKeys.lastSuraKey);
  final aya = prefs.getInt(PrefsKeys.lastAyaKey);

  if (sura == null || aya == null) return null;

  return {
    'sura': sura,
    'aya': aya,
  };
}