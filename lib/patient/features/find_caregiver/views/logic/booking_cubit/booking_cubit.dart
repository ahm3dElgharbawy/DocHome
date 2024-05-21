import 'dart:convert';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:http/http.dart' as http;

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit() : super(BookingInitial());
  // final FindCargiverRepo findCargiverRepo;
  // Future<Either<Failure, Unit>> storeNewBooking(
  //     {required double latitude,
  //     required double longitude,
  //     required List<int> services,
  //     required int caregiverId,
  //     required String bookingDate,
  //     required String startDate,
  //     required String phoneNumber}) async {
         
  //   var result = await findCargiverRepo.sendPostRequest(
  //       latitude: latitude,
  //       longitude: longitude,
  //       services: services,
  //       caregiverId: caregiverId,
  //       bookingDate: bookingDate,
  //       startDate: startDate,
  //       phoneNumber: phoneNumber);

    
  // }
  

  Future<void> sendPostRequest(
      { double? latitude,
       double? longitude,
       List<int>? services,
       int? caregiverId,
       String? bookingDate,
       String? startDate,
       String? phoneNumber}) async {
    final url = Uri.parse('https://dochomd4u.000webhostapp.com/api/bookings'); 

  // JSON data to be sent
  final Map<String, dynamic> data = {
    "location": {
      "latitude": latitude,
      "longitude": longitude
    },
    "services": services,
    "caregiver_id": caregiverId,
    "booking_date": bookingDate,
    "start_date": startDate,
    "phone_number": phoneNumber,
  };

  final String body = json.encode(data);

  try {
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    if (response.statusCode == 200) {
      emit(BookingSuccess());
      print('Request successful');
    } else {
      emit(BookingFaluier());
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
  }
}
