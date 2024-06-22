import 'package:dartz/dartz.dart';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/patient/features/home/data/models/category_model.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategoryModel>>> getAllCategories();
  Future<Either<Failure, List<Caregiver>>> getAllPopularCaregivers();
}