import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/utils/errors/dio_failuers.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class FindCargiverRepo {
  Future<Either<Failure, List<ServiceMod>>> getAllServices();
}
