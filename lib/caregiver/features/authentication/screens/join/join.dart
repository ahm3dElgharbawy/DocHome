import 'package:dochome/caregiver/features/authentication/screens/join/widgets/category_dropdown.dart';
import 'package:dochome/caregiver/features/authentication/screens/join/widgets/services_dropdown.dart';
import 'package:dochome/caregiver/features/authentication/screens/join/widgets/uploads.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';

class JoinScreen extends StatelessWidget {
  const JoinScreen({super.key});

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
                Text("Join to Us", style: CAppStyles.styleSemiBold25(context)),
                const SizedBox(height: CSizes.spaceBtwItems),
                CTextFieldWithInnerShadow(
                  hintText: "Email",
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => CTextFieldValidator.emailCheck(value),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                //? caregiver category drop down menu
                const CCategoryDropdown(items: ["Nursing","Physical Therapy","Laboratory","X-Rays"], hint: "Select Your Category"),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                //? caregiver specialty drop down
                const CServicesDropdown(items: ["Lotion Installation","Sensitivity Test","Intravenous Injection","Enema"], hint: "Select Your Specialty"),
                const SizedBox(height: CSizes.spaceBtwInputFields),

                //? uploads
                const UploadsScreen(),
                const SizedBox(height: CSizes.spaceBtwItems),
                CRoundedButton(onPressed: () {}, title: "Send Join Request"),
                //? don't have an account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a Caregiver ?",
                      style: CAppStyles.styleRegular16(context),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Sign In",
                        style: CAppStyles.styleSemiBold16(context).copyWith(
                          color: CColors.primary,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
