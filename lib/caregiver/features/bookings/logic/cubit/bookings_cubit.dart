import 'dart:convert';

import 'package:dochome/caregiver/features/bookings/data/models/bookings.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bookings_state.dart';

class CaregiverBookingsCubit extends Cubit<CaregiverBookingsState> {
  CaregiverBookingsCubit() : super(BookingsInitial());
  static CaregiverBookingsCubit get(BuildContext context) =>
      BlocProvider.of(context);
  List<CaregiverBookingsModel> bookings = [];
  final reportTitleController = TextEditingController();
  final reportContentController = TextEditingController();
  final reportFormKey = GlobalKey<FormState>();

  getBookings() async {
    emit(LoadingCaregiverBookingsState());
    final result = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.caregiverBookings),
    );
    emit(
      result.fold(
          (failure) => FailureCaregiverBookingsState(message: failure.message),
          (r) {
        bookings = (jsonDecode(r.body)["bookings"] as List)
            .map((booking) => CaregiverBookingsModel.fromJson(booking))
            .toList()
            .reversed
            .toList();
        print("########################3");
        for (var element in bookings) {
          print(element.toJson());
        }

        print("########################3");

        return SuccessCaregiverBookingsState();
      }),
    );
  }

  cancelOrAcceptBooking(bool isAccept, int bookingId) async {
    emit(isAccept ? LoadingAcceptBookingState() : LoadingCancelBookingState());
    final result = await ResponseHandler.handle(
      () => ApiCalls.postData(
          EndPoints.approveOrRejectBooking(bookingId: bookingId),
          {"approval_status": isAccept}),
    );
    emit(
      result.fold(
          (failure) =>
              FailureAcceptOrCancelBookingState(message: failure.message),
          (success) {
        bookings.firstWhere((booking) => booking.id == bookingId).status =
            isAccept ? 1 : 0;
        if (isAccept) {
          return SuccessAcceptBookingState();
        } else {
          return SuccessCancelBookingState();
        }
      }),
    );
  }

  addReport({required String username, required int bookingId}) async {
    if (reportFormKey.currentState!.validate()) {
      emit(LoadingReportState());
      final result = await ResponseHandler.handle(
        () => ApiCalls.postData(
          EndPoints.makeReport,
          {
            "title": reportTitleController.text,
            "content": reportContentController.text,
            "user_name": username,
            "booking_id": bookingId,
          },
        ),
      );
      emit(
        result.fold(
          (failure) => FailureReportState(message: failure.message),
          (success) {
            bookings.firstWhere((booking) => booking.id == bookingId).finished = 1;
            return SuccessReportState();
          },
        ),
      );
    }
  }
}
