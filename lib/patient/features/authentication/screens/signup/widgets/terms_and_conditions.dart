import 'package:dochome/patient/features/authentication/screens/terms&conditions/terms_abd_conditions.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CTermsAndConditions extends StatelessWidget {
  const CTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (val) {}),
        Text("I Agree To The", style: CAppStyles.styleRegular13(context)),
        TextButton(
          onPressed: (){
            CHelperFunctions.navigateToScreen(context, const TermsAndConditionScreen());
          },
          child: Text(
            "Terms And Conditions",
            style: CAppStyles.styleSemiBold13(context)
                .copyWith(decoration: TextDecoration.underline,color: CColors.primary),
          ),
        )
      ],
    );
  }
}