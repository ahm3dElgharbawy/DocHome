import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/patient/features/payment/payment_screen/payment_screen.dart';
import 'package:dochome/patient/features/personalization/screens/my_account_screen/myAccountScreen.dart';
import 'package:dochome/patient/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

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
                userName: "mohamedgmetwally",
                userEmail: "@gmail.com",
                color: CColors.primary,
                image: Image.asset(CImages.user), // patient profile image
              ),
              //? containing info like bookings, ...
              const CPatientInfoContainer(),
              CSettingsList(
                child: Column(
                  children: [
                    CSettingsTile(
                      title: "My Account",
                      leadingIcon: Icons.account_circle_outlined,
                      leadingBackgroundColor: const Color(0xfffeb204),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MyAccountScreen(),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      height: CSizes.spaceBtwItems * 2,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      title: "Manage Credits",
                      leadingIcon: Icons.credit_card,
                      leadingBackgroundColor:
                          const Color.fromARGB(255, 187, 46, 212),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditCardForm(),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      height: CSizes.spaceBtwItems * 2,
                      thickness: 1,
                    ),
                    const CSettingsTile(
                      title: "Support",
                      leadingIcon: Icons.support_agent,
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
