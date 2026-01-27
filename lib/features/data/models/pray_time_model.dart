class PrayTime {
  final String fajr;
  final String sunrise;
  final String dhuhr;
  final String asr;
  final String maghrib;
  final String isha;

  PrayTime({
    required this.fajr,
    required this.sunrise,
    required this.dhuhr,
    required this.asr,
    required this.maghrib,
    required this.isha,
  });


  factory PrayTime.fromJson(Map<String, dynamic> json) {
    return PrayTime(
      fajr: json['Fajr'],
      sunrise: json['Sunrise'],
      dhuhr: json['Dhuhr'],
      asr: json['Asr'],
      maghrib: json['Maghrib'],
      isha: json['Isha'],
    );
  }


  factory PrayTime.fromResponse(Map<String, dynamic> json) {
    return PrayTime.fromJson(json['data']['timings']);
  }
}
