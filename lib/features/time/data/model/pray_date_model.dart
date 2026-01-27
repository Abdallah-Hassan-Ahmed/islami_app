class PrayDate {
  final String gregorianDay;
  final String gregorianMonth;
  final String gregorianYear;
  final String gregorianWeekday; 

  final String hijriDay;
  final String hijriMonth;
  final String hijriYear;
  final String hijriWeekdayAr;

  PrayDate({
    required this.gregorianDay,
    required this.gregorianMonth,
    required this.gregorianYear,
    required this.gregorianWeekday,
    required this.hijriDay,
    required this.hijriMonth,
    required this.hijriYear,
    required this.hijriWeekdayAr,
  });

  factory PrayDate.fromJson(Map<String, dynamic> json) {
  final g = json['gregorian'];
  final h = json['hijri'];

  return PrayDate(
    gregorianDay: g['day'],
    gregorianMonth: (g['month']['en'] as String).substring(0, 4),
    gregorianYear: g['year'],
    gregorianWeekday: g['weekday']['en'],

    hijriDay: h['day'],
    hijriMonth: h['month']['ar'],
    hijriYear: h['year'],
    hijriWeekdayAr: h['weekday']['ar'],
  );
}

}
