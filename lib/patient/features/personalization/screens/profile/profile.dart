import 'package:dochome/common/widgets/dialogs/languages_dialog.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/chatbot/screens/chatbot.dart';
import 'package:dochome/patient/features/payment/payment_screen/payment_screen.dart';
import 'package:dochome/patient/features/personalization/data/data_source/profile_settings_data.dart';
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
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CProfileHeader(
                userName: "mohamed",
                userEmail: "@gmail.com",
                color: CColors.primary,
                image: Image.asset(CImages.user), // patient profile image
              ),
              //? containing info like bookings, ...
              const CPatientInfoContainer(),
              CSettingsList(
                child: Column(
                  children: [
                    ...ProfileSettingsData.data(context).map(
                      (item) => CSettingsTile(
                        title: item.title,
                        leadingIcon: item.icon,
                        leadingBackgroundColor: item.leadingBackgroundColor,
                        onTap: item.onTap
                      ),
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
