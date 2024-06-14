import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/patient/features/personalization/screens/change_password/change_password.dart';
import 'package:dochome/patient/features/personalization/screens/my_account/widgets/update_profile_form.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = CHelperFunctions.screenWidth(context);
    final screenHeight = CHelperFunctions.screenHeight(context);
    Patient patient = PatientLocal.get()!;
    print(patient.toJson());
    return Scaffold(
      appBar: const CMainAppBar(
        title: "My Account",
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.05),
            CircleAvatar(
              backgroundColor: const Color(0xFF4D8BBB),
              backgroundImage: patient.avatar != null
                  ? CachedNetworkImageProvider(patient.avatar!)
                  : null,
              radius: screenWidth * 0.1,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: CCircularContainer(
                      onTap: () async {
                        File? file = await CHelperFunctions.pickImage();
                        if (file != null) {
                          print("done");
                          PersonalizationCubit.get(context).updateAvatar(file);
                        }
                      },
                      color: Colors.white,
                      height: screenWidth * .09,
                      width: screenWidth * .09,
                      child: Icon(
                        Icons.camera_alt,
                        size: screenWidth * .05,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.05),
            const UpdateProfileForm(),
            TextButton(
              onPressed: () {
                context.push(ProfileUpdatePasswordScreen(email: patient.email));
              },
              child: Text(
                'Change Password?',
                style: CAppStyles.styleMedium14(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
