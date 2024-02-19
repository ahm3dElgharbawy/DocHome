import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class COnBoardingSliderContent extends StatelessWidget {
  const COnBoardingSliderContent({super.key, required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CSizes.spaceBtwSections * 2),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(width: CHelperFunctions.screenHeight(context) * .6,child: Image.asset(image),),
            const SizedBox(height: CSizes.spaceBtwSections),
            Text(
              title,
              style: CAppStyles.styleBold30(context).apply(color: CColors.primary, fontSizeFactor: .9),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Text(
              subtitle,
              style: CAppStyles.styleRegular16(context).copyWith(color: CColors.darkerGrey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
