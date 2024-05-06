import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/utils/errors/dio_failuers.dart';
import 'package:dartz/dartz.dart';

abstract class FindCargiverRepo {
  Future<Either<DioFailure, List<ServiceMod>>> getAllServices();
}
