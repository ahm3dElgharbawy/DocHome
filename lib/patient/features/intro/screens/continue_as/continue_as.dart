import 'package:dochome/caregiver/features/authentication/screens/login/caregiver_login.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
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
      body: Container(
        alignment: Alignment.bottomCenter,
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                CImages.appLogo,
                width: 200,
              ),
              Text(
                "Best Care in The Comfort of\nYour Home",
                style: CAppStyles.styleMedium14(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 4),
              CRoundedButton(
                onPressed: () {
                  CHelperFunctions.navigateToScreen(
                    context,
                    const LoginScreen(),
                  );
                },
                title: "Patient".tr(context),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    CHelperFunctions.navigateToScreen(
                      context,
                      const CareGiverLoginScreen(),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                      shape: const StadiumBorder(),
                      side: const BorderSide(color: Colors.grey)),
                  child: Text(
                    "Caregiver".tr(context),
                    style: CAppStyles.styleMedium16(context)
                        .copyWith(color: Colors.black),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
