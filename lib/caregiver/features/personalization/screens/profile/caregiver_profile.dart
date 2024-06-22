import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/caregiver/features/personalization/screens/account_information/account_information.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/widgets/info_container.dart';
import 'package:dochome/common/widgets/dialogs/languages_dialog.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/patient/features/intro/screens/continue_as/continue_as.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/caregiver_local.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CaregiverProfileScreen extends StatelessWidget {
  const CaregiverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> emailParts = CaregiverLocal.get()!.email.split("@");
    return Scaffold(
      backgroundColor: CColors.softGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 650,
          child: Stack(
            children: [
              CProfileHeader(
                userName: emailParts.first,
                userEmail: "@${emailParts.last}",
                color: CColors.primary,
                image: CachedNetworkImageProvider(
                  CaregiverLocal.get()!.profileImage.asLink(),
                ),
              ),
              //? containing info like bookings and patients, ...
              const CCaregiverInfoContainer(),
              CSettingsList(
                child: Column(
                  children: [
                    CSettingsTile(
                      title: "Account Information".tr,
                      leadingIcon: Icons.person,
                      leadingBackgroundColor: const Color(0xfffeb204),
                      onTap: () {
                        context.push(const CaregiverAccountInformationScreen());
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      title: "Support".tr,
                      leadingIcon: Icons.support_agent,
                      leadingBackgroundColor: const Color(0xff00b383),
                      onTap: () async {
                        String whatsappUrl =
                            "whatsapp://send?phone=+2001006158626";
                        await launchUrl(Uri.parse(whatsappUrl));
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      title: "Language".tr,
                      leadingIcon: Icons.translate_rounded,
                      leadingBackgroundColor: Colors.deepPurpleAccent,
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => const CLanguagesDialog());
                      },
                    ),
                    const Divider(
                      height: 0,
                      thickness: 1,
                    ),
                    CSettingsTile(
                      onTap: () {
                        PreferenceServices.remove(
                            "CAREGIVER"); // remove local patient data
                        PreferenceServices.setInt("STEP", 1);
                        context.pushReplacementAll(
                          const ContinueAsScreen(),
                        );
                      },
                      title: "Logout".tr,
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
