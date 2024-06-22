import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CCaregiverRememberMe extends StatefulWidget {
  const CCaregiverRememberMe({super.key});

  @override
  State<CCaregiverRememberMe> createState() => _CCaregiverRememberMeState();
}

class _CCaregiverRememberMeState extends State<CCaregiverRememberMe> {
  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CaregiverAuthBloc>();
    return Row(
      children: [
        Checkbox(
            value: bloc.rememberMe,
            onChanged: (val) {
              setState(() {
                bloc.rememberMe = val!;
              });
            }),
        Text("Remember me".tr, style: CAppStyles.styleRegular13(context)),
      ],
    );
  }
}
