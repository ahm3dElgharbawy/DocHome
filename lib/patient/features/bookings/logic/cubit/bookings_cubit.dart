import 'dart:convert';

import 'package:dochome/patient/features/bookings/data/models/booking.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(BookingsInitial());
  static BookingsCubit get(BuildContext context) => BlocProvider.of(context);
  List<PatientBookingModel> bookings = [];

  void getBookings() async {
    emit(LoadingBookingsState());
    final result = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.patientBookings),
    );
    emit(
      result.fold((failure) => FailureBookingsState(message: failure.message),
          (r) {
        bookings = (jsonDecode(r.body)["bookings"] as List)
            .map((booking) => PatientBookingModel.fromJson(booking))
            .toList();
        return SuccessBookingsState();
      }),
    );
  }

  cancelBooking() {}
}
