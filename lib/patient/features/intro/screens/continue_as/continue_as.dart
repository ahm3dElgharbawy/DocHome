import 'package:dochome/caregiver/features/authentication/screens/login/caregiver_login.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                CImages.medicalStaff,
                width: 400,
              ),
              Text(
                "Best Care in The Comfort of Your Home".tr,
                style: CAppStyles.styleSemiBold25(context).copyWith(color: Colors.black),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "would you like to continue as a patient or a caregiver".tr,
                style: CAppStyles.styleRegular14(context),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 4),
              CRoundedButton(
                onPressed: () {
                  context.push(const LoginScreen());
                },
                title: "Patient".tr,
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
                    "Caregiver".tr,
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
