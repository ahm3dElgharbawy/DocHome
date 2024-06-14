import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'personalization_state.dart';

class PersonalizationCubit extends Cubit<PatientPersonalizationState> {
  PersonalizationCubit() : super(PersonalizationInitial());
  static PersonalizationCubit get(context) => BlocProvider.of(context);
  GlobalKey<FormState> updatePasswordFromKey = GlobalKey<FormState>();
  GlobalKey<FormState> updateAccountFromKey = GlobalKey<FormState>();
  List<TextEditingController> myAccountControllers =
      List.generate(3, (i) => TextEditingController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  updateProfile() async {
    emit(LoadingUpdateProfileState());
    Either failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.putData("", {
        "name": myAccountControllers[0].text,
        "phone": myAccountControllers[1].text,
        "email": myAccountControllers[2].text,
      }),
    );
    emit(
      failureOrSuccess.fold(
        (failure) => FailureUpdateProfileState(),
        (success) => SuccessUpdateProfileState(),
      ),
    );
  }

  updatePassword({required String newPassword}) async {
    emit(LoadingUpdatePasswordState());
    Either failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.putData(EndPoints.resetPassword,
          {"new_password": newPassword, "email": PatientLocal.get()!.email}),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          "Failed to update avatar".showAsToast(Colors.red);
          return FailureUpdatePasswordState();
        },
        (success) {
          "update avatar success".showAsToast(Colors.green);
          return SuccessUpdatePasswordState();
        },
      ),
    );
  }

  updateAvatar(File file) async {
    emit(LoadingUpdateAvatarState());
    Either failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.uploadFiles(url: "", files: {
        "profile_image": file,
      }),
    );
    emit(
      failureOrSuccess.fold(
        (failure) => FailureUpdateAvatarState(),
        (success) => SuccessUpdateAvatarState(),
      ),
    );
  }
}
