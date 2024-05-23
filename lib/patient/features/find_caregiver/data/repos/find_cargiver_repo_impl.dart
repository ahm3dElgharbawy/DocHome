import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';

class FindCargiverRepoImpl extends FindCargiverRepo {
  @override
  Future<Either<Failure, List<ServiceModel>>> getAllServicesinCategory(
      {int? id}) async {
    //int id
    var serviceUrl =
        "https://dochomd4u.000webhostapp.com/api/categories/$id/services";

    var result =
        await ResponseHandler.handle(() => ApiCalls.getData(serviceUrl));
    return result.fold((failure) => left(failure), (response) {
      List services = jsonDecode(response.body);
      return right(
          services.map((service) => ServiceModel.fromJson(service)).toList());
    });
  }

///////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, List<CargiverModel>>> getAllCaregiversinCategory(
      {int? id}) async {
    var caregiverUrl =
        "https://dochomd4u.000webhostapp.com/api/categories/$id/caregivers";

    var result =
        await ResponseHandler.handle(() => ApiCalls.getData(caregiverUrl));
    return result.fold((failure) => left(failure), (response) {
      List cargivers = jsonDecode(response.body);
      return right(
        cargivers.map((e) => CargiverModel.fromJson(e)).toList(),
      );
    });
  }

  //////////////////////////////////////////////////////////////////////////////////
  ///
  @override
  Future<Either<Failure, Unit>> storeNewBooking(
      Map<String, dynamic> bookingData) async {
    Either result = await ResponseHandler.handle(
      () => ApiCalls.postData(EndPoints.storeNewBooking, bookingData),
    );
    return result.fold((failure) => left(failure), (response) => right(unit));
  }

  //////////////////////////////////////////////////
  ///
  ///
  @override
  Future<void> sendPostRequest(
      {required double latitude,
      required double longitude,
      required List<int> services,
      required int caregiverId,
      required String bookingDate,
      required String startDate,
      required String phoneNumber}) async {
    final url = Uri.parse('https://your-api-endpoint.com/path'); 

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

  // Convert the Map to a JSON string
  final String body = json.encode(data);

  try {
    // Sending the POST request
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: body,
    );

    // Check if the request was successful
    if (response.statusCode == 200) {
      print('Request successful');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
  }
}
