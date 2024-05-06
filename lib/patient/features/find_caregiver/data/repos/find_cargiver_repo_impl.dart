import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/services/api_calls.dart';
import 'package:dochome/utils/services/response_handler.dart';

class FindCargiverRepoImpl extends FindCargiverRepo {

  @override
  Future<Either<Failure, List<ServiceMod>>> getAllServices() async {
   const Url = "https://dochomd4u.000webhostapp.com/api/categories/1/services";
  

    var result = await ResponseHandler.handle(
        () => ApiCalls.getData(Url));
    return result.fold((failure) => left(failure), (response) {
      List services = jsonDecode(response.body);
      
      return right(
          services.map((service) => ServiceMod.fromJson(service)).toList());

    });

  }
}
