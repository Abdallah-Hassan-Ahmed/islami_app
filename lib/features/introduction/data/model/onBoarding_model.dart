import 'package:islami_app/core/utils/app_images.dart';

class OnBoardingModel {
  final String text;
  String? supText;
  String? supText2;
  final String image;

  OnBoardingModel({required this.text, required this.image, this.supText , this.supText2});

  static List<OnBoardingModel> onBoarding = [
    OnBoardingModel(
      text: "Welcome To Islami",
      image: AppImages.marhaba,
    ),
    OnBoardingModel(
      text: "Welcome To Islami",
      image: AppImages.onBoarding2,
      supText: "We Are Very Excited To Have You In Our",
      supText2: "Community",
    ),
    OnBoardingModel(
      text: "Reading the Quran",
      image: AppImages.onBoarding3,
      supText: "Read, and your Lord is the Most Generous",
    ),
    OnBoardingModel(
      text: "Bearish",
      image: AppImages.onBoarding4,
      supText: "Praise the name of your Lord, the Most",
      supText2: "High",
    ),
    OnBoardingModel(
      text: "Holy Quran Radio",
      image: AppImages.onBoarding5,
      supText:
          "You can listen to the Holy Quran Radio",
      supText2:
          "through the application for free and easily",
    ),
  ];
}
