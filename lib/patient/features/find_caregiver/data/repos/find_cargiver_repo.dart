import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class FindCaregiverRepo {
  Future<Either<Failure, List<ServiceModel>>> getAllServicesInCategory(
      {int? id});
  Future<Either<Failure, List<Caregiver>>> getAllCaregiversInCategory(
      {int? id});

  Future<Either<Failure, Unit>> storeNewBooking(
      Map<String, dynamic> bookingData);

  Future<void> sendPostRequest({
    required double latitude,
    required double longitude,
    required List<int> services,
    required int caregiverId,
    required String bookingDate,
    required String startDate,
    required String phoneNumber,
  });

//////////////////////////////////////////////////////////////////////////////////////////
}
