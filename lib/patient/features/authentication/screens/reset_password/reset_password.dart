import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();


  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formkey,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        CImages.resetPassword,
                        height: CSizes.defaultImageHeight,
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "New Password".tr(context),
                      style: CAppStyles.styleSemiBold24(context),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      "Enter New password ".tr(context),
                      style: CAppStyles.styleRegular20(context)
                          .copyWith(color: CColors.darkGrey),
                    ),
                    const SizedBox(height: CSizes.spaceBtwSections),
                    CTextFieldWithInnerShadow(
                      controller: passwordController,
                      hintText: "Password".tr(context),
                      margin: EdgeInsets.zero,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      obscureText: true,
                      validator: (value) =>
                          CTextFieldValidator.passwordTextFieldValidator(value),
                    ),
                    const SizedBox(height: CSizes.spaceBtwInputFields),
                    CTextFieldWithInnerShadow(
                      controller: passwordConfirmationController,
                      hintText: "Confirm Password".tr(context),
                      margin: EdgeInsets.zero,
                      prefixIcon: const Icon(
                        Icons.lock,
                      ),
                      obscureText: true,
                      validator: (value) =>
                          CTextFieldValidator.passwordTextFieldValidator(value),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    BlocConsumer<AuthBloc, AuthState>(
                      listener: (context, state) {
                        if (state is SuccessState) {
                          context.pushReplacementAll(const LoginScreen());
                        } else if (state is FailureState) {
                          state.message.showAsToast(Colors.red);
                        }
                      },
                      builder: (context, state) {
                        return CRoundedButton(
                          onPressed: () {
                            if(!formkey.currentState!.validate()) return;
                            if (passwordController.text ==
                                passwordConfirmationController.text) {
                              context.read<AuthBloc>().add(
                                    ResetPasswordEvent(
                                      email: widget.email,
                                      newPassword: passwordController.text,
                                    ),
                                  );
                            } else {
                              CStrings.passwordNotMatch.showAsToast(Colors.red);
                            }
                          },
                          title: "Save".tr(context),
                          child: state is LoadingState
                              ? const CLoadingWidget()
                              : null,
                        );
                      },
                    )
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
