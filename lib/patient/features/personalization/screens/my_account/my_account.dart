
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/personalization/screens/change_password/change_password.dart';
import 'package:dochome/patient/features/personalization/screens/my_account/widgets/profile_avatar.dart';
import 'package:dochome/patient/features/personalization/screens/my_account/widgets/update_profile_form.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = CHelperFunctions.screenHeight(context);
    Patient patient = PatientLocal.get()!;
    return Scaffold(
      appBar: CMainAppBar(
        title: "Account Information".tr,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            ProfileAvatarWidget(patientAvatar: patient.avatar),
            SizedBox(height: screenHeight * 0.05),
            const UpdateProfileForm(),
            TextButton(
              onPressed: () {
                context.push(ProfileUpdatePasswordScreen(email: patient.email));
              },
              child: Text(
                'Change Password?'.tr,
                style: CAppStyles.styleMedium14(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
