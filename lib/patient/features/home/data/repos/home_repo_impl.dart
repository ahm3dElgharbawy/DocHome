import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/home/data/models/categorie_model.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';

class HomeRepoImpl extends HomeRepo{
  @override
  Future<Either<Failure, List<CategorieModel>>> getAllCategories() async {
    var categoriesUrl =
        "https://dochomd4u.000webhostapp.com/api/categories";
        var result =
        await ResponseHandler.handle(() => ApiCalls.getData(categoriesUrl));
    return result.fold((failure) => left(failure), (response) {
      List categories = jsonDecode(response.body);
      return right(
          categories.map((categorie) => CategorieModel.fromJson(categorie)).toList());
    });
  }

}