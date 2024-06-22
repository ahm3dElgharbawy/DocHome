import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/caregiver/features/layout/caregiver_layout_screen.dart';
import 'package:dochome/caregiver/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/caregiver_local.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaregiverUpdateAccountInformationForm extends StatelessWidget {
  const CaregiverUpdateAccountInformationForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = CaregiverPersonalizationCubit.get(context);
    final Caregiver caregiver = CaregiverLocal.get()!;
    return Form(
      key: cubit.updateAccountFromKey,
      child: Column(
        children: [
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[0]..text = caregiver.name,
            hintText: "username".tr,
            prefixIcon: const Icon(Icons.switch_account),
            validator: (p0) => CTextFieldValidator.requiredTextField(p0),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[1]..text = caregiver.email,
            hintText: "email".tr,
            prefixIcon: const Icon(Icons.local_post_office),
            validator: (val) => CTextFieldValidator.emailCheck(val),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[2]..text = caregiver.phone,
            hintText: "phone number".tr,
            prefixIcon: const Icon(Icons.phone),
            validator: (val) =>
                CTextFieldValidator.phoneNumberTextFieldValidator(val),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
              controller: cubit.myAccountControllers[3],
              hintText: "Create new Password".tr,
              prefixIcon: const Icon(Icons.lock),
              obscureText: true,
              validator: (val) {
                if (val != null && val.isNotEmpty) {
                  return CTextFieldValidator.passwordTextFieldValidator(val);
                }
                return null;
              }),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[4]..text = caregiver.about??"",
            hintText: "about".tr,
            prefixIcon: const Icon(Icons.info),
            maxLines: 3,
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          BlocConsumer<CaregiverPersonalizationCubit,
              CaregiverPersonalizationState>(
            listener: (context, state) {
              if (state is SuccessCaregiverUpdateProfileState) {
                "Success Update Profile".tr.showAsToast(Colors.green);
                context.pushReplacementAll(const CaregiverLayoutScreen(
                  initialIndex: 2,
                ));
              } else if (state is FailureCaregiverUpdateProfileState) {
                "Failure Update Profile".tr.showAsToast(Colors.red);
              }
            },
            builder: (context, state) {
              return CRoundedButton(
                  onPressed: () {
                    if (cubit.updateAccountFromKey.currentState!.validate()) {
                      cubit.updateProfile();
                    }
                  },
                  title: 'Save'.tr,
                  margin: const EdgeInsets.symmetric(
                      horizontal: CSizes.defaultSpace),
                  child: state is LoadingCaregiverUpdateProfileState
                      ? const CLoadingWidget(
                          indicatorColor: Colors.white,
                        )
                      : null);
            },
          ),
        ],
      ),
    );
  }
}
