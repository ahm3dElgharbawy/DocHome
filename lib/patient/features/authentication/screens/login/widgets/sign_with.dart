import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CSignInWith extends StatelessWidget {
  const CSignInWith({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.symmetric(vertical: CSizes.spaceBtwSections),
          child: Row(
            children: [
              const Expanded(
                  child: Divider(
                      thickness: 1, endIndent: 10, color: CColors.darkGrey)),
              Text("Or sign in  with".tr,
                  style: CAppStyles.styleRegular16(context)
                      .copyWith(color: CColors.darkGrey)),
              const Expanded(
                  child: Divider(
                      thickness: 1, indent: 10, color: CColors.darkGrey)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  CImages.apple,
                  height: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  CImages.google,
                  height: 30,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Image.asset(
                  CImages.facebook,
                  height: 30,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
