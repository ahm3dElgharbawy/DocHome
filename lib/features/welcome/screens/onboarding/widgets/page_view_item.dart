import 'package:dochome/common/styles/app_styles.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CPageViewItem extends StatelessWidget {
  const CPageViewItem({super.key, required this.image, required this.title, required this.subtitle});
  final String image;
  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: CSizes.spaceBtwSections * 2),
      child: Column(
        children: [
          Image.asset(image),
          const SizedBox(height: CSizes.spaceBtwSections),
          Text(
            title,
            style: CAppStyles.textStyleBold30.copyWith(color: CColors.primary),
          ),
          Text(
            subtitle,
            style: CAppStyles.textStyle20,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
