import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/forgot_password/forgot_password.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CRememberMe extends StatelessWidget {
  const CRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Row(
      children: [
        StatefulBuilder(
          builder: (context, setState) => Checkbox(
              value: bloc.rememberMe,
              onChanged: (val) {
                setState(() {
                  bloc.rememberMe = val!;
                });
              }),
        ),
        Text("Remember me", style: CAppStyles.styleRegular13(context)),
        const Spacer(),
        TextButton(
          onPressed: () {
            CHelperFunctions.navigateToScreen(
                context, const ForgotPasswordScreen());
          },
          child: Text(
            "Forget your password?",
            style: CAppStyles.styleRegular13(context).copyWith(
                decoration: TextDecoration.underline, color: Colors.black),
          ),
        )
      ],
    );
  }
}
