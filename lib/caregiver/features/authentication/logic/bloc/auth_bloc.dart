import 'dart:io';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/caregiver/features/authentication/data/models/category.dart';
import 'package:dochome/caregiver/features/authentication/data/repo/auth.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class CaregiverAuthBloc extends Bloc<CaregiverAuthEvent, CaregiverAuthState> {
  final CaregiverAuthRepo repoImp;
  final loginControllers = List.generate(
      2, (i) => TextEditingController()); // Login fields [email, password]
  final joinControllers = List.generate(
      4,
      (i) =>
          TextEditingController()); // Register fields [email, password, phone]
  List<File?> files = List.generate(
      3, (index) => null); // [profileImage, identityCard, professionCard]
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool rememberMe = false;
  List<CenterModel>? centers = [];
  List<CategoryModel>? categories = [];
  String? centerId;
  String? categoryId;
  CaregiverAuthBloc({required this.repoImp}) : super(AuthInitial()) {
    on<CaregiverAuthEvent>((event, emit) async {
      if (event is LoginCaregiverEvent) {
        emit(LoadingState()); // show loading indicator in the ui
        // ------------------------
        final eitherFailureOrSuccess = await repoImp.caregiverLogin(
            email: event.email, password: event.password);
        // ------------------------
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => FailureState(
              message: failure.message,
            ),
            (data) {
              return SuccessLoginCaregiver(
                  message: CStrings.loginSuccess, caregiver: data);
            },
          ),
        );
      } else if (event is RegisterCaregiverEvent) {
        emit(LoadingState());
        final eitherFailureOrSuccess =
            await repoImp.caregiverRegister(event.caregiverData, event.files);
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => FailureState(
              message: failure.message,
            ),
            (data) => const SuccessRegisterCaregiver(
              message: CStrings.registerSuccess,
            ),
          ),
        );
      } else if (event is GetCentersEvent) {
        emit(LoadingDropDowns());
        final eitherFailureOrSuccess = await repoImp.getCenters();
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => FailureState(
              message: failure.message,
            ),
            (data) {
              centers = data;
              return const SuccessLoadingCenters();
            },
          ),
        );
      } else if (event is GetCategoriesEvent) {
        emit(LoadingDropDowns());
        final eitherFailureOrSuccess = await repoImp.getCategories();
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => FailureState(
              message: failure.message,
            ),
            (data) {
              categories = data;
              return const SuccessLoadingCategories();
            },
          ),
        );
      }
    });
  }

  joinUs() {
    Map<String, File> images = {
      "profile_image": files.elementAt(0)!,
      "professional_card_image": files.elementAt(1)!,
      "id_card_image": files.elementAt(2)!,
    };
    Map<String, String> caregiverData = {
      "name": joinControllers.elementAt(0).text,
      "email": joinControllers.elementAt(1).text,
      "password": joinControllers.elementAt(2).text,
      "password_confirmation": joinControllers.elementAt(2).text,
      "phone": joinControllers.elementAt(3).text,
      "center_id": centerId!,
      "category_id": categoryId!,
    };
    add(RegisterCaregiverEvent(caregiverData: caregiverData, files: images));
  }

  @override
  Future<void> close() {
    // Dispose all controllers
    for (final TextEditingController controller in loginControllers) {
      controller.dispose();
    }
    for (final TextEditingController controller in joinControllers) {
      controller.dispose();
    }
    return super.close();
  }
}
