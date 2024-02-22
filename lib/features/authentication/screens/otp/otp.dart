import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/features/authentication/screens/reset_password/reset_password.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: SvgPicture.asset(
                  CImages.otp,
                  height: 240,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Verification",
                style: CAppStyles.styleSemiBold24(context),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Enter Verification Code",
                style: CAppStyles.styleRegular20(context)
                    .copyWith(color: CColors.darkGrey),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //?? here we add otp
                  OTPTextField(
                    fieldWidth: 58,
                    length: 4,
                    fieldStyle: FieldStyle.box,
                    width: 260,
                    style: CAppStyles.styleMedium18(context),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  //? remaining time
                  Text(
                    "00:59 Sec",
                    style: CAppStyles.styleMedium14(context),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  //? resend the otp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive code ?",
                        style: CAppStyles.styleRegular14(context),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Re-send",
                          style: CAppStyles.styleSemiBold14(context)
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              CRoundedButton(
                  onPressed: () {
                    CHelperFunctions.navigateToScreen(
                        context, const ResetPasswordScreen());
                  },
                  title: "Continue")
            ]),
          ),
        ),
      ),
    );
  }
}
