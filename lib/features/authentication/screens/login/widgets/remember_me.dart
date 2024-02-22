import 'package:dochome/features/authentication/screens/forgot_password/forgot_password.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CRememberMe extends StatelessWidget {
  const CRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (val) {}),
        Text("Remember me", style: CAppStyles.styleRegular13(context)),
        const Spacer(),
        TextButton(
          onPressed: () {
            CHelperFunctions.navigateToScreen(context, const ForgotPasswordScreen());
          },
          child: Text(
            "Forget your password?",
            style: CAppStyles.styleRegular13(context)
                .copyWith(decoration: TextDecoration.underline,color: Colors.black),
          ),
        )
      ],
    );
  }
}
