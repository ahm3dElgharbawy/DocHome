import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/terms&conditions/terms_abd_conditions.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CTermsAndConditions extends StatelessWidget {
  const CTermsAndConditions({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<AuthBloc>();
    return Row(
      children: [
        StatefulBuilder(
          builder: (context, setState) => Checkbox(
            value: bloc.agreeTerms,
            onChanged: (val) {
              setState(() {
                bloc.agreeTerms = val!;
              });
            },
          ),
        ),
        Text("I Agree To The".tr(context),
            style: CAppStyles.styleRegular13(context)),
        TextButton(
          onPressed: () {
            CHelperFunctions.navigateToScreen(
                context, const TermsAndConditionScreen());
          },
          child: Text(
            "Terms And Conditions".tr(context),
            style: CAppStyles.styleSemiBold13(context).copyWith(
                decoration: TextDecoration.underline, color: CColors.primary),
          ),
        )
      ],
    );
  }
}
