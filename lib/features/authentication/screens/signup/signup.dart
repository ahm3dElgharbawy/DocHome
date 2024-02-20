import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

import 'widgets/terms_and_conditions.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                Text("Create an Account",
                    style: CAppStyles.styleSemiBold25(context)),
                const SizedBox(height: CSizes.spaceBtwItems),
                const CTextFieldWithInnerShadow(
                  hintText: "User Name",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.person),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                const CTextFieldWithInnerShadow(
                  hintText: "Phone",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.phone),
                  keyboardType: TextInputType.phone,
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
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
                const SizedBox(height: CSizes.spaceBtwInputFields),
                const CTextFieldWithInnerShadow(
                  hintText: "Confirm Password",
                  margin: EdgeInsets.zero,
                  prefixIcon: Icon(Icons.lock),
                  obscureText: true,
                ),
                //? terms and conditions 
                const CTermsAndConditions(),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                CRoundedButton(onPressed: () {}, title: "Sign up"),
                //? don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "I have an Account ?",
                      style: CAppStyles.styleRegular16(context),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign in",
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
