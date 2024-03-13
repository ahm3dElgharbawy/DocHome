import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/authentication/screens/otp/otp.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        CImages.resetPassword,
                        height: 240,
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "New Password",
                      style: CAppStyles.styleSemiBold24(context),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "Enter New password ",
                      style: CAppStyles.styleRegular20(context)
                          .copyWith(color: CColors.darkGrey),
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections),
                    const CTextFieldWithInnerShadow(
                      hintText: "Password",
                      margin: EdgeInsets.zero,
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: CSizes.spaceBtwInputFields),
                    const CTextFieldWithInnerShadow(
                      hintText: "Confirm Password",
                      margin: EdgeInsets.zero,
                      prefixIcon: Icon(
                        Icons.lock,
                      ),
                      obscureText: true,
                    ),
                    Row(
                      children: [
                        Checkbox(value: false, onChanged: (value) {}),
                        Text(
                          "Remember me",
                          style: CAppStyles.styleRegular13(context),
                        )
                      ],
                    ),
                    CRoundedButton(
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const LoginScreen(showBackArrow: false),
                            ),
                            (route) => false,
                          );
                        },
                        title: "Save")
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
