
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class StatusSection extends StatelessWidget {
  const StatusSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Status',
          style: AppStyles.styleSemiBold21(context),
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Text(
                  '87',
                  style: AppStyles.styleBold16(context),
                ),
                Text(
                  'Patients',
                  style: AppStyles.styleMedium14(context),
                )
              ],
            ),
            Column(
              children: [
                Text(
                  '7',
                  style: AppStyles.styleBold16(context),
                ),
                Text(
                  'Experince',
                  style: AppStyles.styleMedium14(context),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}
