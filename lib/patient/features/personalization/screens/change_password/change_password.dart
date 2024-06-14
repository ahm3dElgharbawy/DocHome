import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/authentication/screens/login/login.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
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
import 'package:fluttertoast/fluttertoast.dart';

class ProfileUpdatePasswordScreen extends StatefulWidget {
  const ProfileUpdatePasswordScreen({super.key, required this.email});
  final String email;

  @override
  State<ProfileUpdatePasswordScreen> createState() => _ProfileUpdatePasswordScreenState();
}

class _ProfileUpdatePasswordScreenState extends State<ProfileUpdatePasswordScreen> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

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
                    BlocConsumer<PersonalizationCubit, PatientPersonalizationState>(
                      listener: (context, state) {
                        if (state is SuccessUpdatePasswordState) {
                          context.pop();
                          "Password changed successfully".showAsToast(Colors.green);
                        } else if (state is FailureUpdatePasswordState) {
                          "Change password failure".showAsToast(Colors.red);
                        }
                      },
                      builder: (context, state) {
                        return CRoundedButton(
                          onPressed: () {
                            if (passwordController.text == passwordConfirmationController.text && formkey.currentState!.validate()) {
                              PersonalizationCubit.get(context).updatePassword(newPassword: passwordController.text);
                            } else {
                              CStrings.passwordNotMatch.showAsToast(Colors.red,gravity: ToastGravity.TOP);
                            }
                          },
                          title: "Save".tr(context),
                          child: state is LoadingUpdatePasswordState
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
