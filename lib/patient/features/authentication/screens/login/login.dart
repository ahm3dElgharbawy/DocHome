import 'package:dochome/patient/features/authentication/screens/login/widgets/login_form.dart';
import 'package:dochome/patient/features/authentication/screens/login/widgets/sign_with.dart';
import 'package:dochome/patient/features/authentication/screens/signup/signup.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                Text("Login", style: CAppStyles.styleSemiBold25(context)),
                const SizedBox(height: CSizes.spaceBtwItems),
                const CLoginForm(),
                //? sign with section
                const CSignInWith(),
                //? don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an Account ? ",
                      style: CAppStyles.styleRegular16(context),
                    ),
                    TextButton(
                      onPressed: () {
                        context.push(const SignupScreen());
                      },
                      child: Text(
                        "Sign up",
                        style: CAppStyles.styleSemiBold16(context).copyWith(
                            color: CColors.primary,
                            decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
