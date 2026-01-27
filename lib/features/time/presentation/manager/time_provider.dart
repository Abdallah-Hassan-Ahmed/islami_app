import 'dart:async';
import 'package:flutter/material.dart';

import 'package:islami_app/features/time/data/time_servies.dart';
import 'package:islami_app/features/time/data/model/pray_time_model.dart';
import 'package:islami_app/features/time/data/model/pray_date_model.dart';

class TimeProvider extends ChangeNotifier {
  final TimeServices _service = TimeServices();

  PrayTime? prayTime;
  PrayDate? prayDate;

  bool isLoading = false;


  String? nextPrayName;
  Duration? nextPrayDuration;

  Timer? _timer;


  Future<void> loadPrayTime() async {
    isLoading = true;
    notifyListeners();

    try {
      final data = await _service.getPrayTime();



      prayTime = PrayTime.fromJson(data['timings']);
      prayDate = PrayDate.fromJson(data['date']);

      _calculateNextPray();
      _startTimer();
    } catch (e) {
      debugPrint('TIME PROVIDER ERROR =====>');
      debugPrint(e.toString());
    }

    isLoading = false;
    notifyListeners();
  }


  void _startTimer() {
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(minutes: 1), (_) {
      _calculateNextPray();
      notifyListeners();
    });
  }

  void _calculateNextPray() {
    if (prayTime == null) return;

    final now = DateTime.now();

    DateTime toToday(String time) {
      final parts = time.split(':');
      return DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(parts[0]),
        int.parse(parts[1]),
      );
    }

    final prayers = [
      {'name': 'Fajr', 'time': prayTime!.fajr},
      {'name': 'Dhuhr', 'time': prayTime!.dhuhr},
      {'name': 'Asr', 'time': prayTime!.asr},
      {'name': 'Maghrib', 'time': prayTime!.maghrib},
      {'name': 'Isha', 'time': prayTime!.isha},
    ];

    for (final p in prayers) {
      final date = toToday(p['time']!);
      if (date.isAfter(now)) {
        nextPrayName = p['name'];
        nextPrayDuration = date.difference(now);
        return;
      }
    }

    final fajrTomorrow = toToday(prayTime!.fajr).add(const Duration(days: 1));

    nextPrayName = 'Fajr';
    nextPrayDuration = fajrTomorrow.difference(now);
  }


  String get formattedNextPrayTime {
    if (nextPrayDuration == null) return '--:--';

    final h = nextPrayDuration!.inHours.toString().padLeft(2, '0');
    final m = nextPrayDuration!.inMinutes
        .remainder(60)
        .toString()
        .padLeft(2, '0');

    return '$h:$m';
  }

  
  String get gregorianWeekday {
    return prayDate?.gregorianWeekday ?? '';
  }

  String get hijriWeekday {
    return prayDate?.hijriWeekdayAr ?? '';
  }


  String get gregorianFormattedDate {
    if (prayDate == null) return '';
    return "${prayDate!.gregorianDay} ${prayDate!.gregorianMonth},\n${prayDate!.gregorianYear}";
  }

  String get hijriFormattedDate {
    if (prayDate == null) return '';
    return "${prayDate!.hijriDay} ${prayDate!.hijriMonth},\n${prayDate!.hijriYear}";
  }


  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
