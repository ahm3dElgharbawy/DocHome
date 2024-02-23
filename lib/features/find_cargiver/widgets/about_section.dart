
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'About',
          style: AppStyles.styleSemiBold21(context),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          'A nurse performs all nursing and home health care tasks',
          style: AppStyles.styleLight16(context),
        ),
      ],
    );
  }
}
