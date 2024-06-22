import 'dart:convert';
import 'dart:io';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/personalization/data/models/profile_statistics.dart';
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
  final updatePasswordFromKey = GlobalKey<FormState>();
  final updateAccountFromKey = GlobalKey<FormState>();
  List<TextEditingController> myAccountControllers =
      List.generate(3, (i) => TextEditingController());
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  File? avatar;
  late PatientProfileStatisticsModel statistics;

  getStatistics() async {
    emit(LoadingStatisticsState());

    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.patientProfileStatistics),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          "Failed to load statistic".showAsToast(Colors.red);
          return FailureLoadingStatisticsState();
        },
        (response) {
          statistics =
              PatientProfileStatisticsModel.fromJson(jsonDecode(response.body));
          return SuccessLoadingStatisticsState(statisticsModel: statistics);
        },
      ),
    );
  }

  updateProfile() async {
    emit(LoadingUpdateProfileState());
    Map<String, File> files = {};
    if (avatar != null) {
      files['profile_image'] = avatar!;
    }
    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.postDataWithFiles(
          EndPoints.patientProfileUpdate,
          {
            "name": myAccountControllers[0].text,
            "phone": myAccountControllers[1].text,
            "email": myAccountControllers[2].text,
          },
          files),
    );
    emit(
      failureOrSuccess.fold(
        (failure) => FailureUpdateProfileState(),
        (response) {
          Patient p = Patient.fromJson(jsonDecode(response.body)['user']);
          PatientLocal.updatePatient(p);
          return SuccessUpdateProfileState();
        },
      ),
    );
  }

  updatePassword({required String newPassword}) async {
    emit(LoadingUpdatePasswordState());
    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.putData(EndPoints.resetPassword,
          {"new_password": newPassword, "email": PatientLocal.get()!.email}),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          "Change password failure".tr.showAsToast(Colors.red);
          return FailureUpdatePasswordState();
        },
        (success) {
          "Password changed successfully".tr.showAsToast(Colors.green);
          return SuccessUpdatePasswordState();
        },
      ),
    );
  }

  // updateAvatar(File file) async {
  //   emit(LoadingUpdateAvatarState());
  //   Either failureOrSuccess = await ResponseHandler.handle(
  //     () => ApiCalls.uploadFiles(url: "", files: {
  //       "profile_image": file,
  //     }),
  //   );
  //   emit(
  //     failureOrSuccess.fold(
  //       (failure) => FailureUpdateAvatarState(),
  //       (success) => SuccessUpdateAvatarState(),
  //     ),
  //   );
  // }
}
