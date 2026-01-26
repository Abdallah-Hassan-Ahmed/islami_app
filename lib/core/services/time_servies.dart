import 'package:dio/dio.dart';

class TimeServices {
  final Dio dio = Dio();

  Future<void> getPrayTime() async {
    Response response = await dio.get(
      'https://api.aladhan.com/v1/timingsByCity/20-01-2026?city=cairo&country=egypt&method=8',
    );

    Map<String, dynamic> jsonData = response.data;

    Map<String, String> prayTime =
        Map<String, String>.from(jsonData["data"]["timings"]);

    print(prayTime);
  }
}
