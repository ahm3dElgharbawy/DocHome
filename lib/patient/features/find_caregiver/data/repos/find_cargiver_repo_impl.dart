import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/endpoints/endpoints.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/services/api_calls.dart';
import 'package:dochome/utils/services/response_handler.dart';

class FindCargiverRepoImpl extends FindCargiverRepo {
  @override
  Future<Either<Failure, List<Service>>> getAllServices() async {
    var result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.allServices));
    return result.fold((failure) => left(failure), (response) {
      List services = jsonDecode(response.body)['data'];
      return right(
          services.map((service) => Service.fromJson(service)).toList());
    });

    // try {
    //   var result = await ResponseHandler.handle(
    //       () => ApiCalls.getData(EndPoints.getService));
    //   List<Service> services = [];
    //   for (var item in result['data']) {
    //     services.add(Service.fromJson(item));
    //   }
    //   return right(services);
    // } catch (e) {
    //   return left(Failure(e.toString()));
    // }
  }
}
