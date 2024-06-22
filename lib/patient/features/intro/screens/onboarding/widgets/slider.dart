import 'package:dochome/patient/features/intro/screens/onboarding/widgets/slider_content.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class COnBoardingSlider extends StatelessWidget {
  const COnBoardingSlider(
      {super.key, required this.pageController, this.onPageChanged});
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged,
      children: [
        COnBoardingSliderContent(
            image: CImages.onBoarding1,
            title: "onboarding-title1".tr,
            subtitle: "onboarding-subtitle1".tr),
        COnBoardingSliderContent(
            image: CImages.onBoarding2,
            title: "onboarding-title2".tr,
            subtitle: "onboarding-subtitle2".tr),
        COnBoardingSliderContent(
            image: CImages.onBoarding3,
            title: "onboarding-title3".tr,
            subtitle: "onboarding-subtitle3".tr),
      ],
    );
  }
}
