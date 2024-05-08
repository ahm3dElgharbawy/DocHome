import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:dochome/utils/errors/failures.dart';

class FindCargiverRepoImpl extends FindCargiverRepo {
  @override
  Future<Either<Failure, List<ServiceModel>>> getAllServicesinCategory(
      {int? id}) async {
    //int id
    var serviceUrl =
        "https://dochomd4u.000webhostapp.com/api/categories/$id/services";

    var result =
        await ResponseHandler.handle(() => ApiCalls.getData(serviceUrl));
    return result.fold((failure) => left(failure), (response) {
      List services = jsonDecode(response.body);
      return right(
          services.map((service) => ServiceModel.fromJson(service)).toList());
    });
  }

///////////////////////////////////////////////////////////////////////////////////////////////////
  @override
  Future<Either<Failure, List<CargiverModel>>> getAllCaregiversinCategory(
      {int? id}) async {
    var caregiverUrl =
        "https://dochomd4u.000webhostapp.com/api/categories/$id/caregivers";

    var result =
        await ResponseHandler.handle(() => ApiCalls.getData(caregiverUrl));
    return result.fold((failure) => left(failure), (response) {
      List cargivers = jsonDecode(response.body);
      return right(
        cargivers.map((e) => CargiverModel.fromJson(e)).toList(),
      );
    });
  }
}
