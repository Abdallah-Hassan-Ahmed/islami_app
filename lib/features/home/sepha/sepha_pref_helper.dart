import 'package:shared_preferences/shared_preferences.dart';

class SephaPrefHelper {
  static const _counterKey = 'sepha_counter';
  static const _turnsKey = 'sepha_turns';
  static const _nextKey = 'sepha_next';

  static Future<void> save({
    required int counter,
    required double turns,
    required int next,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(_counterKey, counter);
    await prefs.setDouble(_turnsKey, turns);
    await prefs.setInt(_nextKey, next);
  }

  static Future<Map<String, dynamic>> load() async {
    final prefs = await SharedPreferences.getInstance();
    return {
      'counter': prefs.getInt(_counterKey) ?? 0,
      'turns': prefs.getDouble(_turnsKey) ?? 0.0,
      'next': prefs.getInt(_nextKey) ?? 0,
    };
  }

  static Future<void> reset() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_counterKey);
    await prefs.remove(_turnsKey);
    await prefs.remove(_nextKey);
  }
}
