import 'package:flutter/material.dart';
import 'package:islami_app/features/home/quran/widget/shard_prefs.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MostRecentlyProvider extends ChangeNotifier {
  List<int> mostRecentlyList = [];

  void refreshMostRecently() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentlayAsString =
        prefs.getStringList(PrefsKeys.mostRecentlyKey) ?? [];
    mostRecentlyList = mostRecentlayAsString
        .map((Element) => int.parse(Element))
        .toList();
    notifyListeners();
  }
}
