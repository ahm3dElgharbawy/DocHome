import 'package:dochome/common/widgets/main_widgets/dropdown.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/authentication/screens/signup/widgets/terms_and_conditions.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CSignupForm extends StatefulWidget {
  const CSignupForm({super.key});

  @override
  State<CSignupForm> createState() => _CSignupFormState();
}

class _CSignupFormState extends State<CSignupForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late AuthBloc authBloc;
  String? centerId;
  @override
  void initState() {
    super.initState();
    authBloc = context.read<AuthBloc>()..add(const FetchCentersEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is SuccessState) {
          context.pushReplacementAll(const LoginScreen());
          CHelperFunctions.showSnackBar(
              context: context,
              message: CStrings.registerSuccess,
              type: StatusType.success);
        }
        if (state is FailureState) {
          CHelperFunctions.showSnackBar(
            context: context,
            message: state.message,
          );
        }
      },
      builder: (context, state) => IgnorePointer(
        ignoring: state is LoadingState ? true : false,
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(0),
                hintText: "Patient Name",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.person),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(1),
                hintText: "Phone",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(2),
                hintText: "Email",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => CTextFieldValidator.emailCheck(value),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(3),
                hintText: "Password",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: authBloc.signupControllers.elementAt(4),
                hintText: "Confirm Password",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              //? Centers dropdown menu
              if (state is LoadingCentersState)
                const CLoadingWidget(indicatorColor: CColors.primary),
              if (state is FailureState)
                const CDropdown(
                  items: [],
                  hint: "Center",
                  validator: CTextFieldValidator.requiredTextField,
                ),
              if (state is LoadedCentersState)
                CDropdown(
                  items: state.centers,
                  hint: "Center",
                  validator: CTextFieldValidator.requiredTextField,
                  onChanged: (val) {
                    centerId = val;
                  },
                ),
              //? terms and conditions
              const CTermsAndConditions(),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CRoundedButton(
                onPressed: () {
                  registerUser();
                },
                title: "Sign up",
                child: state is LoadingState ? const CLoadingWidget() : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  registerUser() {
    if (formKey.currentState!.validate()) {
      List<TextEditingController> controllers = authBloc.signupControllers;
      //? show error on confirmation password not match
      if (controllers.elementAt(3).text != controllers.elementAt(4).text) {
        return CHelperFunctions.showSnackBar(
            context: context, message: CStrings.passwordNotMatch);
      }
      //? show error on not accept terms and conditions
      if (!authBloc.agreeTerms) {
        return CHelperFunctions.showSnackBar(
            context: context, message: CStrings.agreeTerms);
      }
      //? form data
      Map<String, String> patientData = {
        'name': controllers.elementAt(0).text,
        'phone': controllers.elementAt(1).text,
        'email': controllers.elementAt(2).text,
        'password': controllers.elementAt(3).text,
        'password_confirmation': controllers.elementAt(4).text,
        'center_id': centerId!,
      };
      //? register event
      context
          .read<AuthBloc>()
          .add(RegisterPatientEvent(patientData: patientData));
    }
  }
}
