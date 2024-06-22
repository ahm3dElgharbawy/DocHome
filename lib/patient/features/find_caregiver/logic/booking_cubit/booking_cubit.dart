import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  static BookingCubit get(BuildContext context) => BlocProvider.of(context);
  final TextEditingController startDateController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Future<void> bookCaregiver({
    required double latitude,
    required double longitude,
    required List<int> services,
    required int? caregiverId,
    String? bookingDate,
    required String? phoneNumber,
  }) async {
    emit(BookingLoading());
    final Map<String, dynamic> data = {
      "location": {"latitude": latitude, "longitude": longitude},
      "services": services,
      "caregiver_id": caregiverId,
      "booking_date": DateTime.now().toIso8601String(),
      "phone_number": phoneNumber,
      "start_date": startDateController.text,
      "password" : passwordController.text,
    };
    
    final result = await ResponseHandler.handle(
      () => ApiCalls.postData(EndPoints.bookCaregiver, data),
    );

    emit(result.fold(
      (failure) => BookingFailure(message: failure.message),
      (success) => BookingSuccess(),
    ));
  }
}
