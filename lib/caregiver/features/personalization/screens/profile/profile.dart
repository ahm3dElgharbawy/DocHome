import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CaregiverProfileScreen extends StatelessWidget {
  const CaregiverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                image: Image.asset(CImages.caregiver)
              ),
              //? containing info like bookings and patients, ...
              const CCaregiverInfoContainer(),
              CSettingsList(
                child: Column(
                  children: [
                    CSettingsTile(
                      title: "Account Information",
                      leadingIcon: Icons.person,
                      leadingBackgroundColor: const Color(0xfffeb204),
                      onTap: () {
                        // print("object");
                      },
                    ),
                    const Divider(
                      height: CSizes.spaceBtwItems * 2,
                      thickness: 1,
                    ),
                    const CSettingsTile(
                      title: "Support",
                      leadingIcon: Icons.support,
                      leadingBackgroundColor: Color(0xff00b383),
                    ),
                    const Divider(
                      height: CSizes.spaceBtwItems * 2,
                      thickness: 1,
                    ),
                    const CSettingsTile(
                      title: "Logout",
                      leadingIcon: Icons.logout,
                      leadingBackgroundColor: Colors.red,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}