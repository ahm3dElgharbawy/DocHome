import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dartz/dartz.dart';

abstract class FindCargiverRepo {
  Future<Either<Failure, List<Service>>> getAllServices();
}
