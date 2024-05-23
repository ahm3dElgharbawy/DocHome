import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/home/data/models/categorie_model.dart';
import 'package:dochome/utils/errors/failures.dart';

abstract class HomeRepo{
  Future<Either<Failure, List<CategorieModel>>> getAllCategories();
}