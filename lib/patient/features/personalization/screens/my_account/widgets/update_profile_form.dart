import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateProfileForm extends StatelessWidget {
  const UpdateProfileForm({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = PersonalizationCubit.get(context);
    final Patient patient = PatientLocal.get()!;
    return Form(
      key: cubit.updateAccountFromKey,
      child: Column(
        children: [
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[0]..text = patient.name,
            hintText: "username".tr,
            prefixIcon: const Icon(Icons.switch_account),
            validator: (p0) => CTextFieldValidator.requiredTextField(p0),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[1]..text = patient.phone,
            hintText: "phone number".tr,
            prefixIcon: const Icon(Icons.phone),
            validator: (val) =>
                CTextFieldValidator.phoneNumberTextFieldValidator(val),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[2]..text = patient.email,
            hintText: "email".tr,
            prefixIcon: const Icon(Icons.local_post_office),
            validator: (val) => CTextFieldValidator.emailCheck(val),
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          BlocConsumer<PersonalizationCubit, PatientPersonalizationState>(
            listener: (context, state) {
              if (state is SuccessUpdateProfileState) {
                "Success Update Profile".tr.showAsToast(Colors.green);
                context.pushReplacementAll(
                    const PatientLayoutScreen(initialIndex: 3));
              } else if (state is FailureUpdateProfileState) {
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
                  child: state is LoadingUpdateProfileState
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
