import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/features/authentication/screens/login/widgets/remember_me.dart';
import 'package:dochome/features/authentication/screens/login/widgets/sign_with.dart';
import 'package:dochome/features/authentication/screens/signup/signup.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
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
                const CTextFieldWithInnerShadow(
                  hintText: "Email",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.email),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                const CTextFieldWithInnerShadow(
                  hintText: "Password",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.lock),
                ),
                //? remember me and forget password section
                const CRememberMe(),
                CRoundedButton(onPressed: () {}, title: "Sign in"),

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
                        CHelperFunctions.navigateToScreen(context, const SignupScreen());
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
            ),
          ),
        ),
      ),
    );
  }
}
