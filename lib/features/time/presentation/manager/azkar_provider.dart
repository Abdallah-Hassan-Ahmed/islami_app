import 'package:flutter/material.dart';
import 'package:islami_app/features/time/data/azkar_service.dart';
import 'package:islami_app/features/time/data/model/azkar_model.dart';

class AzkarProvider extends ChangeNotifier {
  final AzkarService _service = AzkarService();

  bool isLoading = false;
  Map<String, List<Zekr>> azkarMap = {};

  Future<void> loadAzkar() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _service.fetchAzkar();

      data.forEach((key, value) {
        final List list = value is List ? value : [];
        azkarMap[key] = list
            .expand((e) => e is List ? e : [e])
            .map((e) => Zekr.fromJson(e))
            .toList();
      });

      debugPrint('AZKAR KEYS => ${azkarMap.keys}');
    } catch (e) {
      debugPrint('❌ AZKAR ERROR: $e');
    }

    isLoading = false;
    notifyListeners();
  }

  List<Zekr> getAzkarByCategory(String key) {
    return azkarMap[key] ?? [];
  }
}
