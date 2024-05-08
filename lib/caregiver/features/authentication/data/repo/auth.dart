import 'dart:convert';
import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/caregiver/features/authentication/data/models/category.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:http/http.dart' as http;
import 'package:dochome/utils/errors/failures.dart';

typedef LoginOrRegisterCaregiver = Future<http.Response> Function();

abstract class CaregiverAuthRepo {
  Future<Either<Failure, Caregiver>> caregiverLogin(
      {required String email, required String password});
  Future<Either<Failure, Unit>> caregiverRegister(
      Map<String, String> caregiverData, Map<String, File> files);
  Future<Either<Failure, List<CategoryModel>>> getCategories();
  Future<Either<Failure, List<CenterModel>>> getCenters();
}

class CaregiverAuthRepoImpl implements CaregiverAuthRepo {
  final NetworkInfo networkInfo;
  const CaregiverAuthRepoImpl({required this.networkInfo});
  @override
  Future<Either<Failure, Caregiver>> caregiverLogin(
      {required email, required password}) async {
    Either result = await ResponseHandler.handle(
      () => ApiCalls.postData(
        EndPoints.loginCaregiver,
        {"email": email, "password": password},
      ),
    );
    return result.fold((failure) => left(failure), (response) {
      final Map<String, dynamic> caregiver =
          jsonDecode(response.body)['caregiver'];
      final String token = jsonDecode(response.body)['access_token'];
      PreferenceServices.setString("TOKEN", token); // Store token
      return right(Caregiver.fromJson(caregiver));
    });
  }

  @override
  Future<Either<Failure, Unit>> caregiverRegister(caregiverData, files) async {
    Either result = await ResponseHandler.handle(() =>
        ApiCalls.postDataWithFiles(
            EndPoints.registerCaregiver, caregiverData, files));
    return result.fold((failure) => left(failure), (response) => right(unit));
  }

  @override
  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    Either result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.allCategories));
    return result.fold((failure) => left(failure), (response) {
      final categories = (jsonDecode(response.body) as List)
          .map((cat) => CategoryModel.fromJson(cat))
          .toList();
      return right(categories);
    });
  }

  @override
  Future<Either<Failure, List<CenterModel>>> getCenters() async {
    Either result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.getAllCenters));

    return result.fold((failure) => left(failure), (response) {
      List data = jsonDecode(response.body)['data'];
      return right(data.map((center) => CenterModel.fromJson(center)).toList());
    });
  }
}
