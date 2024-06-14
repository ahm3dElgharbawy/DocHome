import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
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
            hintText: "username",
            prefixIcon: const Icon(Icons.switch_account),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[1]..text = patient.phone,
            hintText: "phone number",
            prefixIcon: const Icon(Icons.phone),
          ),
          const SizedBox(height: CSizes.spaceBtwInputFields),
          CTextFieldWithInnerShadow(
            controller: cubit.myAccountControllers[2]..text = patient.email,
            hintText: "email",
            prefixIcon: const Icon(Icons.local_post_office),
          ),
          const SizedBox(height: CSizes.spaceBtwSections),
          BlocConsumer<PersonalizationCubit, PatientPersonalizationState>(
            listener: (context,state) {
              if(state is SuccessUpdateProfileState){
                "Success Update Profile".showAsToast(Colors.green);
              } else if(state is  FailureUpdateProfileState){
                "Failure Update Profile".showAsToast(Colors.red);
              }
            },
            builder: (context, state) {
              return CRoundedButton(
                onPressed: () {
                  if (cubit.updateAccountFromKey.currentState!.validate()) {
                    cubit.updateProfile();
                  }
                },
                title: 'Save',
                margin:
                    const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
                child : state is LoadingUpdateProfileState ? const CLoadingWidget() : null
              );
            },
          ),
        ],
      ),
    );
  }
}
