import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
    this.about,
  });
  final String? about;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About'.tr,
          style: CAppStyles.styleSemiBold21(context),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          about != null
              ? about!
              : "My mission is to enhance the quality of life for my clients by offering personalized care that meets their unique needs and preferences".tr,
          style: CAppStyles.styleLight16(context),
        ),
      ],
    );
  }
}
