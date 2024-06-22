
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/caregiver/features/personalization/screens/account_information/widgets/profile_avatar.dart';
import 'package:dochome/caregiver/features/personalization/screens/account_information/widgets/update_account_infromation_form.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/caregiver_local.dart';
import 'package:flutter/material.dart';

class CaregiverAccountInformationScreen extends StatelessWidget {
  const CaregiverAccountInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = CHelperFunctions.screenHeight(context);
    Caregiver caregiver = CaregiverLocal.get()!;
    return Scaffold(
      appBar: CMainAppBar(
        title: "Account Information".tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            CaregiverProfileAvatarWidget(caregiverAvatar: caregiver.profileImage),
            SizedBox(height: screenHeight * 0.05),
            const CaregiverUpdateAccountInformationForm(),
          ],
        ),
      ),
    );
  }
}
