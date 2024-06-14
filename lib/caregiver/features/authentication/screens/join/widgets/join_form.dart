import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/caregiver/features/authentication/screens/join/widgets/uploads_buttons.dart';
import 'package:dochome/caregiver/features/authentication/screens/login/caregiver_login.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/dropdown.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CJoinForm extends StatefulWidget {
  const CJoinForm({super.key});

  @override
  State<CJoinForm> createState() => _CJoinFormState();
}

class _CJoinFormState extends State<CJoinForm> {
  late CaregiverAuthBloc bloc;

  @override
  void initState() {
    super.initState();
    bloc = context.read<CaregiverAuthBloc>();
    bloc.add(const GetCentersEvent());
    bloc.add(const GetCategoriesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: bloc.joinFormKey,
      child: BlocConsumer<CaregiverAuthBloc, CaregiverAuthState>(
        listener: (context, state) {
          if (state is SuccessRegisterCaregiver) {
            CStrings.caregiverSuccessRegister.showAsToast(Colors.green);
            context.pushReplacementAll(const CareGiverLoginScreen());
          } else if (state is FailureState) {
            state.message.showAsToast(Colors.red);
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              CTextFieldWithInnerShadow(
                controller: bloc.joinControllers.elementAt(0),
                hintText: "Name",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.person),
                validator: (value) =>
                    CTextFieldValidator.requiredTextField(value),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: bloc.joinControllers.elementAt(1),
                hintText: "Email",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) => CTextFieldValidator.emailCheck(value),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: bloc.joinControllers.elementAt(2),
                hintText: "Password",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.lock),
                obscureText: true,
                validator: (p0) =>
                    CTextFieldValidator.passwordTextFieldValidator(p0),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              CTextFieldWithInnerShadow(
                controller: bloc.joinControllers.elementAt(3),
                hintText: "Phone",
                margin: EdgeInsets.zero,
                prefixIcon: const Icon(Icons.phone),
                keyboardType: TextInputType.phone,
                validator: (p0) =>
                    CTextFieldValidator.phoneNumberTextFieldValidator(p0),
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              //? caregiver centers drop down menu
              CDropdown(
                items: bloc.centers ?? [],
                hint: "Select the Center",
                validator: (value) =>
                    CTextFieldValidator.requiredTextField(value),
                onChanged: (centerId) {
                  bloc.centerId = centerId;
                },
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),
              //? caregiver categories drop down menu
              CDropdown(
                items: bloc.categories ?? [],
                hint: "Select Your Category",
                validator: (value) =>
                    CTextFieldValidator.requiredTextField(value),
                onChanged: (categoryId) {
                  bloc.categoryId = categoryId;
                },
              ),
              const SizedBox(height: CSizes.spaceBtwInputFields),

              //? caregiver specialties drop down
              // const CServicesDropdown(items: ["Lotion Installation","Sensitivity Test","Intravenous Injection","Enema"], hint: "Select Your Specialty"),
              // const SizedBox(height: CSizes.spaceBtwInputFields),

              //? uploads section
              const CUploadsButtons(),
              const SizedBox(height: CSizes.spaceBtwItems),
              CRoundedButton(
                onPressed: () {
                  if (bloc.joinFormKey.currentState!.validate()) {
                    bool emptyFiles = false;
                    for (int i = 0; i < bloc.files.length; i++) {
                      if (bloc.files.elementAt(i) == null) {
                        emptyFiles = true;
                        getUploadsMessage(i).showAsToast(Colors.red);
                      }
                    }
                    if (!emptyFiles) {
                      bloc.joinUs();
                    }
                  }
                },
                title: "Send Join Request",
                child: state is LoadingState ? const CLoadingWidget() : null,
              ),
            ],
          );
        },
      ),
    );
  }

  String getUploadsMessage(int i) {
    if (i == 0) {
      return "Personal image is required";
    } else if (i == 1) {
      return "id care is required";
    } else {
      return "profession card is required";
    }
  }
}
