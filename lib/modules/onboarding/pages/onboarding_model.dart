import '../../../core/gen/assets.gen.dart';

class OnboardingModel {
  final String image;
  final String title;
  final String disc;

  OnboardingModel({
    required this.image,
    required this.title,
    required this.disc,
  });

  static List<OnboardingModel> onboardingData = [
    OnboardingModel(
      image: Assets.images.welcome.path,
      title: "Welcome To Islami App",
      disc: "",
    ),
    OnboardingModel(
      image: Assets.images.masged.path,
      title: "Welcome To Islami",
      disc: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      image: Assets.images.moshafimg.path,
      title: "Reading the Quran",
      disc: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      image: Assets.images.doaa.path,
      title: "Bearish",
      disc: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      image: Assets.images.mic.path,
      title: "Holy Quran Radio",
      disc: "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];
}
