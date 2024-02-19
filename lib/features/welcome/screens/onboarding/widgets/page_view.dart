import 'package:dochome/features/welcome/screens/onboarding/widgets/page_view_item.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CPageView extends StatelessWidget {
  const CPageView({super.key, required this.pageController, this.onPageChanged});
  final PageController pageController;
  final void Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: pageController,
      onPageChanged: onPageChanged ,
      children: const [
        CPageViewItem(
            image: CImages.onBoarding1,
            title: "Home visit",
            subtitle:
                "Without going to the hospital, you can install a solution, injections, catheterization, breathing sessions,"),
        CPageViewItem(
            image: CImages.onBoarding2,
            title: "physical therapy",
            subtitle:
                "They can bring specialized equipment and provide hands-on therapy, tailoring a treatment plan that fits your specific needs and goals"),
        CPageViewItem(
            image: CImages.onBoarding3,
            title: "Continuous follow-up",
            subtitle:
                "Monitoring patients, the elderly, and their diet, moment by moment"),
      ],
    );
  }
}
