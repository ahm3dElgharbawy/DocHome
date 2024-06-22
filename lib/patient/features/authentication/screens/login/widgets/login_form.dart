import 'dart:convert';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/widgets/remember_me.dart';
import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CLoginForm extends StatelessWidget {
  const CLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    final loginFormKey = GlobalKey<FormState>();

    return Form(
      key: loginFormKey,
      child: Column(
        children: [
          CTextFieldWithInnerShadow(
            controller: authBloc.loginControllers.elementAt(0),
            hintText: "Email".tr,
            margin: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.email),
            keyboardType: TextInputType.emailAddress,
            validator: (value) => CTextFieldValidator.emailCheck(value),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: authBloc.loginControllers.elementAt(1),
            hintText: "Password".tr,
            margin: EdgeInsets.zero,
            prefixIcon: const Icon(Icons.lock),
            obscureText: true,
            validator: (value) =>
                CTextFieldValidator.passwordTextFieldValidator(value),
          ),
          //? remember me and forget password section
          const CRememberMe(),
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is LoginPatientSuccessState) {
                PreferenceServices.setString(
                    "PATIENT", jsonEncode(state.patient.toJson()));
                if (authBloc.rememberMe) {
                  PreferenceServices.setInt("STEP", 2);
                }
                if (context.mounted) {
                  context.pushReplacementAll(const PatientLayoutScreen());
                }
              } else if (state is LoginPatientFailureState) {
                if (context.mounted) {
                  state.message.showAsToast(Colors.red);
                }
              }
            },
            builder: (context, state) {
              return CRoundedButton(
                onPressed: () {
                  if (loginFormKey.currentState!.validate()) {
                    authBloc.add(LoginPatientEvent(
                      email: authBloc.loginControllers.elementAt(0).text,
                      password: authBloc.loginControllers.elementAt(1).text,
                    ));
                  }
                },
                title: "Sign in".tr,
                child: state is LoginPatientLoadingState
                    ? const CLoadingWidget(indicatorColor: Colors.white)
                    : null,
              );
            },
          ),
        ],
      ),
    );
  }
}
