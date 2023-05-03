import 'package:social_app/core/resources/assets_manager.dart';
import 'package:social_app/core/resources/strings_manager.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel> onBoarding = [
  OnBoardingModel(
    image: ImageAssets.start,
    title: AppStrings.title1,
    body: AppStrings.body1,
  ),
  OnBoardingModel(
    image: ImageAssets.middle,
    title: AppStrings.title2,
    body: AppStrings.body2,
  ),
  OnBoardingModel(
    image: ImageAssets.end,
    title: AppStrings.title3,
    body: AppStrings.body3,
  ),
];
