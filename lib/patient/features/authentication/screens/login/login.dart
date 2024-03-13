import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/screens/login/widgets/remember_me.dart';
import 'package:dochome/patient/features/authentication/screens/login/widgets/sign_with.dart';
import 'package:dochome/patient/features/authentication/screens/signup/signup.dart';
import 'package:dochome/patient/features/home/screens/home.dart';
import 'package:dochome/patient/features/home/screens/home_screen.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key,this.showBackArrow = true});
  final bool showBackArrow;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(showBackArrow: showBackArrow,),
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
                CTextFieldWithInnerShadow(
                  hintText: "Email",
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => CTextFieldValidator.emailCheck(value),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                const CTextFieldWithInnerShadow(
                  hintText: "Password",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
                ),
                //? remember me and forget password section
                const CRememberMe(),
                CRoundedButton(
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const Home()),
                        (route) => false,
                      );
                    },
                    title: "Sign in"),

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
                        CHelperFunctions.navigateToScreen(
                            context, const SignupScreen());
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
