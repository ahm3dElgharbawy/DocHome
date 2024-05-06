import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/endpoints/endpoints.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/services/dio_api_service.dart';
import 'package:dochome/utils/errors/dio_failuers.dart';

class FindCargiverRepoImpl extends FindCargiverRepo {
  final ApiService apiService;

  FindCargiverRepoImpl(this.apiService);
  @override
  Future<Either<DioFailure, List<ServiceMod>>> getAllServices() async {
    try {
      var data = await apiService.get(url: EndPoints.allServices);
      List<ServiceMod> services = [];
      for (var item in data['data']) {
        try {
          services.add(ServiceMod.fromJson(item));
        } catch (e) {
          services.add(ServiceMod.fromJson(item));
        }
      }
      return right(services);
    } catch (e) {
      if (e is DioError) {
        return left(DioServerFailure.fromDioError(e));
      }

       return left(DioServerFailure(e.toString()));
    }

    // var result = await ResponseHandler.handle(
    //     () => ApiCalls.getData(EndPoints.allServices));
    // return result.fold((failure) => left(failure), (response) {
    //   List services = jsonDecode(response.body)['data'];
    //   // print(response.body);
    //   return right(
    //       services.map((service) => Service.fromJson(service)).toList());

    // });

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
