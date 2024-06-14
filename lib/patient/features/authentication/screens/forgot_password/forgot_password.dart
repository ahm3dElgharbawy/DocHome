import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/otp/otp.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  TextEditingController emailController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Center(
                child: SvgPicture.asset(
                  CImages.forgotPassword,
                  height: CSizes.defaultImageHeight,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Forgot\nPassword?".tr(context),
                style: CAppStyles.styleSemiBold24(context),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Don't worry ! Please enter your email address".tr(context),
                style: CAppStyles.styleRegular20(context)
                    .copyWith(color: CColors.darkGrey),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Form(
                key: formKey,
                child: CTextFieldWithInnerShadow(
                  hintText: "Email".tr(context),
                  margin: EdgeInsets.zero,
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                  controller: emailController,
                  validator: (value) => CTextFieldValidator.emailCheck(value),
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwSections * 2),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessSendOtp) {
                    context.pushReplacement(OTPScreen(
                      email: emailController.text,
                    ));
                  } else if (state is FailureState) {
                    state.message.showAsToast(Colors.red);
                  }
                },
                builder: (context, state) {
                  return CRoundedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        context.read<AuthBloc>().add(
                              SendOtpEvent(email: emailController.text),
                            );
                      }
                    },
                    title: "Send".tr(context),
                    child:
                        state is LoadingState ? const CLoadingWidget() : null,
                  );
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
