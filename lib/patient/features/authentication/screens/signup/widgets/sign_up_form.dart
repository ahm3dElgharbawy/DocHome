import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/main_widgets/dropdown.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CSignupForm extends StatefulWidget {
  const CSignupForm({super.key});

  @override
  State<CSignupForm> createState() => _CSignupFormState();
}

class _CSignupFormState extends State<CSignupForm> {
  late AuthBloc authBloc;
  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(const FetchCentersEvent());
  }

  @override
  Widget build(BuildContext context) {
    final registerFormKey = GlobalKey<FormState>();

    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is RegisterPatientSuccessState) {
          context.pushReplacementAll(const LoginScreen());
          CStrings.registerSuccess.showAsToast(Colors.green);
        }
        if (state is RegisterPatientFailureState) {
          state.message.showAsToast(Colors.red);
        }
      },
      builder: (context, state) => IgnorePointer(
        ignoring: state is RegisterPatientLoadingState ? true : false,
        child: Form(
          key: registerFormKey,
          child: Column(
            children: [
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(0),
                hintText: "Patient Name".tr,
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(1),
                hintText: "Phone".tr,
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: (val) =>
                    CTextFieldValidator.phoneNumberTextFieldValidator(val),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(2),
                hintText: "Email".tr,
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => CTextFieldValidator.emailCheck(value),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(3),
                hintText: "Password".tr,
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                validator: (val) =>
                    CTextFieldValidator.passwordTextFieldValidator(val),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                  controller: authBloc.signupControllers.elementAt(4),
                  hintText: "Confirm Password".tr,
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(Icons.lock),
                  obscureText: true,
                  validator: (val) =>
                      CTextFieldValidator.passwordTextFieldValidator(val)),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              //? Centers dropdown menu
              state is FailureLoadingCentersState
                  ? CustomFailureWidget(onTap: () {
                      context.read<AuthBloc>().add(const FetchCentersEvent());
                    })
                  : CDropdown(
                      items: authBloc.centers ?? [],
                      hint: "Center".tr,
                      validator: CTextFieldValidator.requiredTextField,
                      onChanged: (centerId) {
                        authBloc.centerId = centerId;
                      },
                    ),
              //? terms and conditions
              const CTermsAndConditions(),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CRoundedButton(
                onPressed: () {
                  if (registerFormKey.currentState!.validate()) {
                    authBloc.registerPatient(context);
                  }
                },
                title: "Sign up".tr,
                child: state is RegisterPatientLoadingState
                    ? const CLoadingWidget(indicatorColor: Colors.white)
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
