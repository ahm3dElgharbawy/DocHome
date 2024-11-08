import 'package:dochome/common/widgets/dialogs/languages_dialog.dart';
import 'package:dochome/patient/features/chatbot/screens/chatbot.dart';
import 'package:dochome/patient/features/intro/screens/welcome/welcome.dart';
import 'package:dochome/patient/features/payment/screens/my_wallet/my_wallet.dart';
import 'package:dochome/patient/features/personalization/data/models/profile_settings.dart';
import 'package:dochome/patient/features/personalization/screens/my_account/my_account.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

abstract class ProfileSettingsData {
  static List<ProfileSettingsModel> data(BuildContext context) => [
        ProfileSettingsModel(
          leadingBackgroundColor: const Color(0xfffeb204),
          title: "Account Information".tr,
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
          leadingBackgroundColor: const Color(0xff00b383),
          title: "Support".tr,
          icon: Icons.support_agent,
          onTap: () async {
            String whatsappUrl = "whatsapp://send?phone=+2001006158626";
            await launchUrl(Uri.parse(whatsappUrl));
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: Colors.pinkAccent,
          title: "My Wallet".tr,
          icon: Icons.account_balance_wallet_rounded,
          onTap: () async {
            context.push(const MyWalletScreen());
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: Colors.deepPurpleAccent,
          title: "Language".tr,
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
          title: "ChatBot".tr,
          icon: Icons.hive,
          onTap: () {
            context.push(const ChatBotScreen());
          },
        ),
        ProfileSettingsModel(
          leadingBackgroundColor: Colors.red,
          title: "Logout".tr,
          icon: Icons.logout,
          onTap: () {
            PreferenceServices.remove("PATIENT"); // remove local patient data
            PreferenceServices.setInt("STEP", 1);
            context.pushReplacementAll(const WelcomeScreen());
          },
        ),
      ];
}
