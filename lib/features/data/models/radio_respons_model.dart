import 'package:islami_app/features/data/models/radio_model.dart';

class RadioResponse {
  final List<RadioModel> radios;

  RadioResponse({required this.radios});

  factory RadioResponse.fromJson(Map<String, dynamic> json) {
    return RadioResponse(
      radios: (json['radios'] as List)
          .map((e) => RadioModel.fromJson(e))
          .toList(),
    );
  }
}