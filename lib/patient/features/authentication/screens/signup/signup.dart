import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/patient/features/authentication/screens/signup/widgets/sign_up_form.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(title: "Create an Account".tr,),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: CSizes.defaultImageHeight,
                child: SvgPicture.asset(CImages.register),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              //? Signup form
              const CSignupForm(),
              //? Don't have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "I have an Account ?".tr,
                    style: CAppStyles.styleRegular16(context),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "Sign in".tr,
                      style: CAppStyles.styleSemiBold16(context).copyWith(
                          color: CColors.primary,
                          decoration: TextDecoration.underline),
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
