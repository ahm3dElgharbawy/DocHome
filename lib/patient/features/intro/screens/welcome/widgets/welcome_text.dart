import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CWelcomeText extends StatelessWidget {
  const CWelcomeText({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(style: CAppStyles.styleBold30(context), children: [
            TextSpan(text: "welcome to ".tr(context)),
            TextSpan(
                text: "Doc".tr(context),
                style: CAppStyles.styleBold30(context)
                    .copyWith(color: CColors.primary)),
            TextSpan(text: "Home".tr(context)),
          ]),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        Text(
          "the home care system is designed to enhance the delivery of healthcare services to individuals in the comfort of their homes".tr(context),
          style: CAppStyles.styleRegular10(context).copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
