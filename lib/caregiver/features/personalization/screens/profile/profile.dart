import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/profile_header.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/settings_list.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CaregiverProfileScreen extends StatelessWidget {
  const CaregiverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: CColors.softGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 650,
          child: Stack(
            children: [
              CProfileHeader(
                userName: "Ahm3dElsafy",
                userEmail: "@gmail.com",
                color: CColors.primary,
              ),
              
              //? containing info like bookings and patients, ...
              CInfoContainer(),
              CSettingsList()
            ],
          ),
        ),
      ),
    );
  }
}
