import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class FindCargiverRepo {
  Future<Either<Failure, List<ServiceModel>>> getAllServicesinCategory(
      {int? id});
  Future<Either<Failure, List<CargiverModel>>> getAllCaregiversinCategory({int? id});
}
