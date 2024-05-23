import 'dart:convert';

import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/caregiver/features/authentication/screens/login/widgets/remember_me.dart';
import 'package:dochome/caregiver/features/navigation_menu.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CCaregiverLoginForm extends StatelessWidget {
  const CCaregiverLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CaregiverAuthBloc>();
    return Form(
      key: bloc.formKey,
      child: Column(
        children: [
          CTextFieldWithInnerShadow(
            controller: bloc.loginControllers.elementAt(0),
            hintText: "Email",
            margin: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => CTextFieldValidator.emailCheck(value),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: bloc.loginControllers.elementAt(1),
            hintText: "Password",
            margin: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.lock),
            obscureText: true,
          ),
          //? remember me
          const CCaregiverRememberMe(),
          BlocConsumer<CaregiverAuthBloc, CaregiverAuthState>(
            listener: (context, state) {
              if (state is SuccessLoginCaregiver) {
                PreferenceServices.setString(
                    "CAREGIVER", jsonEncode(state.caregiver!.toJson()));
                if (bloc.rememberMe) {
                  PreferenceServices.setInt("STEP", 2);
                }
                if (context.mounted) {
                  context.pushReplacementAll(const CCaregiverNavigationMenu());
                }
              } else if (state is FailureState) {
                CHelperFunctions.showSnackBar(
                    context: context, message: state.message);
              }
            },
            builder: (context, state) => CRoundedButton(
              onPressed: () {
                if (bloc.formKey.currentState!.validate()) {
                  bloc.add(
                    LoginCaregiverEvent(
                      email: bloc.loginControllers.elementAt(0).text,
                      password: bloc.loginControllers.elementAt(1).text,
                    ),
                  );
                }
              },
              title: "Sign in",
              child: state is LoadingState ? const CLoadingWidget() : null,
            ),
          ),
        ],
      ),
    );
  }
}
