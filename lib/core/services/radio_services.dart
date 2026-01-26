import 'package:dio/dio.dart';
import 'package:islami_app/features/data/models/radio_model.dart';
import 'package:islami_app/features/data/models/radio_respons_model.dart';

class RadioServices {
  final Dio dio = Dio();

  Future<List<RadioModel>> getRadioData() async {
    final response = await dio.get('https://data-rosy.vercel.app/radio.json');

    final data = response.data;
    final radios = RadioResponse.fromJson(data);

    return radios.radios;
  }

}
