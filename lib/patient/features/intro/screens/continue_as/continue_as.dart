import 'package:dochome/caregiver/features/authentication/screens/login/caregiver_login.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ContinueAsScreen extends StatelessWidget {
  const ContinueAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Continue As".tr(context),
                    style: CAppStyles.styleBold30(context)
                        .copyWith(color: CColors.primary),
                  ),
                  Image.asset(
                    CImages.appLogo,
                    height: 250,
                  ),
                  CRoundedButton(
                      onPressed: () {
                        CHelperFunctions.navigateToScreen(
                            context, const LoginScreen());
                      },
                      title: "Patient".tr(context)),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  CRoundedButton(
                      onPressed: () {
                        CHelperFunctions.navigateToScreen(
                            context, const CareGiverLoginScreen());
                      },
                      title: "Caregiver".tr(context))
                ],
              ),
            ),
          )),
    );
  }
}
