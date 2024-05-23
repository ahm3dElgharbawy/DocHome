import 'package:dochome/common/widgets/dialogs/languages_dialog.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/chatbot/screens/chatbot.dart';
import 'package:dochome/patient/features/payment/payment_screen/payment_screen.dart';
import 'package:dochome/patient/features/personalization/data/models/profile_settings.dart';
import 'package:dochome/patient/features/personalization/screens/my_account_screen/myAccountScreen.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';

abstract class ProfileSettingsData {
  static List<ProfileSettingsModel> data(BuildContext context) => [
        ProfileSettingsModel(
          leadingBackgroundColor: const Color(0xfffeb204),
          title: "My Account",
          icon: Icons.person,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MyAccountScreen(),
              ),
            );
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: const Color(0xFFBB2ED4),
          title: "Manage Credits",
          icon: Icons.credit_card,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CreditCardForm(),
              ),
            );
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: const Color(0xff00b383),
          title: "Support",
          icon: Icons.support_agent,
          onTap: () {},
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: Colors.deepPurpleAccent,
          title: "Language",
          icon: Icons.translate_rounded,
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const CLanguagesDialog(),
            );
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: const Color(0xFF02B3E3),
          title: "ChatBot",
          icon: Icons.hive,
          onTap: () {
            context.push(const ChatBotScreen());
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: Colors.red,
          title: "Logout",
          icon: Icons.logout,
          onTap: () {
            PreferenceServices.remove("PATIENT"); // remove local patient data
            PreferenceServices.setInt("STEP", 1);
            context.pushReplacementAll(const LoginScreen());
          },
        ),
      ];
}
