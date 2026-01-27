import 'package:dio/dio.dart';

class TimeServices {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> getPrayTime() async {
    final response = await dio.get(
      'https://api.aladhan.com/v1/timingsByCity',
      queryParameters: {
        'city': 'Cairo',
        'country': 'Egypt',
        'method': 5,
      },
    );


    return response.data['data'];
  }
}
