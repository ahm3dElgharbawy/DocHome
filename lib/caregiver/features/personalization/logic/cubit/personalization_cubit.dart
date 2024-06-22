import 'dart:convert';
import 'dart:io';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/caregiver/features/personalization/data/models/caregiver_statistics.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/caregiver_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'personalization_state.dart';

class CaregiverPersonalizationCubit
    extends Cubit<CaregiverPersonalizationState> {
  CaregiverPersonalizationCubit() : super(CaregiverPersonalizationInitial());
  static CaregiverPersonalizationCubit get(context) => BlocProvider.of(context);
  final updatePasswordFromKey = GlobalKey<FormState>();
  final updateAccountFromKey = GlobalKey<FormState>();
  List<TextEditingController> myAccountControllers =
      List.generate(5, (i) => TextEditingController());
  File? avatar;
  late CaregiverProfileStatisticsModel statistics;

  getStatistics() async {
    emit(LoadingCaregiverStatisticsState());

    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.caregiverProfileStatistics),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          "Failed to load statistic".showAsToast(Colors.red);
          return FailureLoadingCaregiverStatisticsState();
        },
        (response) {
          statistics = CaregiverProfileStatisticsModel.fromJson(
              jsonDecode(response.body));
          return SuccessLoadingCaregiverStatisticsState(
              statisticsModel: statistics);
        },
      ),
    );
  }

  updateProfile() async {
    emit(LoadingCaregiverUpdateProfileState());
    Map<String, String> body = {
      "name": myAccountControllers[0].text,
      "email": myAccountControllers[1].text,
      "phone": myAccountControllers[2].text,
      "about": myAccountControllers[4].text,
    };
    if (myAccountControllers[3].text.isNotEmpty) {
      body.addAll({"password": myAccountControllers[3].text});
    }
    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.postDataWithFiles(EndPoints.caregiverProfileUpdate, body,
          avatar != null ? {"profile_image": avatar!} : {}),
    );
    emit(
      failureOrSuccess.fold(
        (failure) => FailureCaregiverUpdateProfileState(),
        (response) {
          Caregiver c =
              Caregiver.fromJson(jsonDecode(response.body)['caregiver']);
          CaregiverLocal.updateCaregiver(c);
          return SuccessCaregiverUpdateProfileState();
        },
      ),
    );
  }

  // updatePassword({required String newPassword}) async {
  //   emit(LoadingCaregiverUpdatePasswordState());
  //   final failureOrSuccess = await ResponseHandler.handle(
  //     () => ApiCalls.putData(EndPoints.resetPassword,
  //         {"new_password": newPassword, "email": CaregiverLocal.get()!.email}),
  //   );
  //   emit(
  //     failureOrSuccess.fold(
  //       (failure) {
  //         "Failed to update avatar".showAsToast(Colors.red);
  //         return FailureCaregiverUpdatePasswordState();
  //       },
  //       (success) {
  //         "update avatar success".showAsToast(Colors.green);
  //         return SuccessCaregiverUpdatePasswordState();
  //       },
  //     ),
  //   );
  // }
}
