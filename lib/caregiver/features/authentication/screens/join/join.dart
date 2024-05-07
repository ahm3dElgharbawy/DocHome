import 'package:dochome/caregiver/features/authentication/screens/join/widgets/join_form.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
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
              const CJoinForm(),

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
    );
  }
}
