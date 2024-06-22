import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/patient/features/home/data/models/category_model.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';

class HomeRepoImpl extends HomeRepo {
  @override
  Future<Either<Failure, List<CategoryModel>>> getAllCategories() async {
    final result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.allCategories));
    return result.fold((failure) => left(failure), (response) {
      List categories = jsonDecode(response.body);
      return right(
        categories.map((category) => CategoryModel.fromJson(category)).toList(),
      );
    });
  }

  @override
  Future<Either<Failure, List<Caregiver>>> getAllPopularCaregivers() async {
    final result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.popularCaregivers));
    return result.fold((failure) => left(failure), (response) {
      List pCaregivers = jsonDecode(response.body)['data'];
      return right(
        pCaregivers.map((caregiver) => Caregiver.fromJson(caregiver)).toList(),
      );
    });
  }
}
