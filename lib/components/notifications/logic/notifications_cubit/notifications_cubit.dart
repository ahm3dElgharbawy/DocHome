import 'dart:convert';

import 'package:dochome/patient/features/home/data/models/notification_model.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial());
  static NotificationsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  List<NotificationModel> notifications = [];
  getAllNotifications(UserType userType) async {
    emit(LoadingNotificationsState());
    final result = await ResponseHandler.handle(
      () => ApiCalls.getData(userType == UserType.patient ? EndPoints.patientNotifications : EndPoints.caregiverNotifications),
    );
    emit(
      result.fold((l) => FailureNotificationsState(message: l.message),
          (r) {
        List data = jsonDecode(r.body)['notifications'];
        notifications = data.map((e) => NotificationModel.fromJson(e)).toList();
        return SuccessNotificationsState();
      }),
    );
  }
}
