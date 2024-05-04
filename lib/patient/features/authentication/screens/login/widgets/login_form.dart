import 'dart:convert';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/widgets/remember_me.dart';
import 'package:dochome/patient/features/home/screens/home.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CLoginForm extends StatelessWidget {
  const CLoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final AuthBloc authBloc = context.read<AuthBloc>();
    GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is SuccessState) {
          PreferenceServices.setString(
              "PATIENT", jsonEncode(state.data!.toJson()));
          if (authBloc.rememberMe) {
            PreferenceServices.setInt("STEP", 2);
          }
          if (context.mounted) {
            context.pushReplacementAll(const Home());
          }
        }
        if (state is FailureState) {
          if (context.mounted) {
            CHelperFunctions.showSnackBar(
              context: context,
              message: state.message,
            );
          }
        }
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state is LoadingState ? true : false,
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CTextFieldWithInnerShadow(
                  controller: authBloc.loginControllers.elementAt(0),
                  hintText: "Email",
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.email),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) => CTextFieldValidator.emailCheck(value),
                ),
                const SizedBox(height: CSizes.spaceBtwInputFields),
                CTextFieldWithInnerShadow(
                  controller: authBloc.loginControllers.elementAt(1),
                  hintText: "Password",
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (value) =>
                      CTextFieldValidator.requiredTextField(value),
                ),
                //? remember me and forget password section
                const CRememberMe(),
                CRoundedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      authBloc.add(LoginPatientEvent(
                        email: authBloc.loginControllers.elementAt(0).text,
                        password: authBloc.loginControllers.elementAt(1).text,
                      ));
                    }
                  },
                  title: "Sign in",
                  child: state is LoadingState ? const CLoadingWidget() : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
