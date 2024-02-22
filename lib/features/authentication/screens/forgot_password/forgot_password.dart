import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/features/authentication/screens/otp/otp.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: SvgPicture.asset(
                  CImages.forgotPassword,
                  height: 240,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Forgot\nPassword?",
                style: CAppStyles.styleSemiBold24(context),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Don't worry ! Please enter your email address",
                style: CAppStyles.styleRegular20(context)
                    .copyWith(color: CColors.darkGrey),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              CTextFieldWithInnerShadow(
                hintText: "Email",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(
                  Icons.email,
                ),
                validator: (value) => CTextFieldValidator.emailCheck(value),
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 2),
              CRoundedButton(onPressed: (){
                CHelperFunctions.navigateToScreen(context, const OTPScreen());
              }, title: "Send")
          
            ]),
          ),
        ),
      ),
    );
  }
}
