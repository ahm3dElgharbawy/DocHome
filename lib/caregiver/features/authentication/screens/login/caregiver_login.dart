import 'package:dochome/caregiver/features/authentication/screens/join/join.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/caregiver/features/navigation_menu.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

class CareGiverLoginScreen extends StatelessWidget {
  const CareGiverLoginScreen({super.key});

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
                Text("Login Caregiver",
                    style: CAppStyles.styleSemiBold25(context)),
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
                //? remember me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (val) {}),
                    Text("Remember me",
                        style: CAppStyles.styleRegular13(context)),
                  ],
                ),
                CRoundedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CCaregiverNavigationMenu(),
                        ),
                      );
                    },
                    title: "Sign in"),
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
      ),
    );
  }
}
