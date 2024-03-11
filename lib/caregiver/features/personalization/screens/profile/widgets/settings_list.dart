import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/settings_tile.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CSettingsList extends StatelessWidget {
  const CSettingsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      child: CRoundedContainer(
        height: null,
        margin: const EdgeInsets.symmetric(
            horizontal: CSizes.defaultSpace, vertical: CSizes.md),
        padding: const EdgeInsets.symmetric(vertical: CSizes.md),
        radius: 20,
        color: Colors.white,
        child: Column(
          children: [
            CSettingsTile(
              title: "Account Information",
              leadingIcon: Icons.person,
              leadingBackgroundColor: const Color(0xfffeb204),
              onTap: () {
                print("object");
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
      ),
    );
  }
}
