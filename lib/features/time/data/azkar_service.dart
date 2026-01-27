import 'dart:convert';
import 'package:dio/dio.dart';

class AzkarService {
  final Dio dio = Dio();

  Future<Map<String, dynamic>> fetchAzkar() async {
    final response = await dio.get(
      'https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json',
      options: Options(responseType: ResponseType.plain), 
    );

    final Map<String, dynamic> decoded =
        jsonDecode(response.data as String);

    return decoded;
  }
}
