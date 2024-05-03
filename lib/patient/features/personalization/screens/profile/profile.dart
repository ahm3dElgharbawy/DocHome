import 'package:dochome/common/widgets/dialogs/languages_dialog.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/payment/payment_screen/payment_screen.dart';
import 'package:dochome/patient/features/personalization/screens/my_account_screen/myAccountScreen.dart';
import 'package:dochome/patient/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.softGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 680,
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
                      height: 0,
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
                            builder: (context) => const CreditCardForm(),
                          ),
                        );
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    const CSettingsTile(
                      title: "Support",
                      leadingIcon: Icons.support_agent,
                      leadingBackgroundColor: Color(0xff00b383),
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      title: "Language",
                      leadingIcon: Icons.translate_rounded,
                      leadingBackgroundColor: Colors.deepPurpleAccent,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => const CLanguagesDialog()
                        );
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      onTap: () {
                        PreferenceServices.remove("PATIENT"); // remove local patient data
                        PreferenceServices.setInt("STEP", 1);
                        context.pushReplacementAll(const LoginScreen());
                      },
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
