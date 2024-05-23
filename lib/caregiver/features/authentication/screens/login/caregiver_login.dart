import 'package:dochome/caregiver/features/authentication/screens/join/join.dart';
import 'package:dochome/caregiver/features/authentication/screens/login/widgets/login_form.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CareGiverLoginScreen extends StatelessWidget {
  const CareGiverLoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(showBackArrow: false,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 200,
                child: Image.asset(CImages.appLogo),
              ),
              // const SizedBox(height: CSizes.spaceBtwItems),
              Text("Login Caregiver",
                  style: CAppStyles.styleSemiBold25(context)),
              const SizedBox(height: CSizes.spaceBtwItems),
              //? login form
              const CCaregiverLoginForm(),
              //? don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Not A Caregiver Yet ? ",
                    style: CAppStyles.styleRegular16(context),
                  ),
                  TextButton(
                    onPressed: () {
                      CHelperFunctions.navigateToScreen(
                        context,
                        const JoinScreen(),
                      );
                    },
                    child: Text(
                      "Join us",
                      style: CAppStyles.styleSemiBold16(context).copyWith(
                        color: CColors.primary,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
