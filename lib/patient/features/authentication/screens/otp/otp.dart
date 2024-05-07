import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/reset_password/reset_password.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({super.key, required this.email});
  final String email;

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  String? otp;

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
                  CImages.otp,
                  height: 240,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Verification".tr(context),
                style: CAppStyles.styleSemiBold24(context),
              ),
              const SizedBox(height: CSizes.spaceBtwItems),
              Text(
                "Enter Verification Code".tr(context),
                style: CAppStyles.styleRegular20(context)
                    .copyWith(color: CColors.darkGrey),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //?? here we add otp
                  OTPTextField(
                    fieldWidth: 58,
                    length: 4,
                    fieldStyle: FieldStyle.box,
                    width: 260,
                    style: CAppStyles.styleMedium18(context),
                    onChanged: (val) {},
                    onCompleted: (val) {
                      otp = val;
                    },
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  //? remaining time
                  Text(
                    "00:59 Sec",
                    style: CAppStyles.styleMedium14(context),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  //? resend the otp
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't receive code ?".tr(context),
                        style: CAppStyles.styleRegular14(context),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Re-send".tr(context),
                          style: CAppStyles.styleSemiBold14(context)
                              .copyWith(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is SuccessState) {
                    context.push(ResetPasswordScreen(
                      email: widget.email,
                    ));
                  } else if (state is FailureState) {
                    CHelperFunctions.showSnackBar(
                        context: context, message: state.message);
                  }
                },
                builder: (context, state) {
                  return CRoundedButton(
                      onPressed: () {
                        if (otp != null) {
                          context.read<AuthBloc>().add(
                              CheckOtpEvent(email: widget.email, otp: otp!));
                        } else {
                          CHelperFunctions.showSnackBar(
                              context: context,
                              message: "You must add the otp".tr(context));
                        }
                      },
                      title: "Continue".tr(context),
                      child: state is LoadingState
                          ? const CLoadingWidget()
                          : null);
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
