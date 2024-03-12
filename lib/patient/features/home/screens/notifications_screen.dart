import 'package:dochome/patient/features/find_caregiver/widgets/custom_app_bar.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Notifications'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset('assets/images/ion_notifications.svg'),
            Text(
              'No Notifications',
              style: CAppStyles.styleMedium24(context),
            ),
            Text(
              'You have no notifications at this time',
              style: CAppStyles.styleRegular16(context),
            )
          ],
        ),
      ),
    );
  }
}