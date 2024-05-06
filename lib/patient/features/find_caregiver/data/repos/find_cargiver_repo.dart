import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class FindCargiverRepo {
  Future<Either<Failure, List<ServiceMod>>> getAllServicesinCategory({int? id});
  Future<Either<Failure, List<ServiceMod>>> getAllCaregiversinCategory();
}
