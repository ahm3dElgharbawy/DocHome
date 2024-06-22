import 'dart:convert';

import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:equatable/equatable.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final FindCaregiverRepo findCaregiverRepo;
  List<ServiceModel> allServices = [];
  List<int> selectedServices = [];
  double totalPrice = 0;

  ServiceCubit(
    this.findCaregiverRepo,
  ) : super(ServiceInitial());
  static ServiceCubit get(context) => BlocProvider.of(context);

  Future<void> getAllServicesInCategory(categoryId) async {
    emit(ServiceLoading());
    var result =
        await findCaregiverRepo.getAllServicesInCategory(id: categoryId);
    result.fold(
        (failure) => {
              emit(ServiceFailure(errorMsg: failure.message)),
            },
        (service) => {
              emit(ServiceSuccess(services: service)),
            });
  }

  Future<void> getAllServices() async {
    print("========================================");
    final result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.allServices));
    result.fold(
        (failure) => {
              // emit(ServiceFailure(errorMsg: failure.message)),
            }, (response) {
      List data = jsonDecode(response.body)['data'];
      print("#############333333");
      print(data);
      print("#############333333");
      allServices = data.map((s) => ServiceModel.fromJson(s)).toList();
      // emit(ServiceSuccess(services: service)),
    });
  }

  List<ServiceModel> getServicesAndCalcPrices(context) {
    final serviceCubit = ServiceCubit.get(context);

    return serviceCubit.allServices.where((service) {
      final bool isContain = serviceCubit.selectedServices.contains(service.id);
      if(isContain){
        totalPrice += double.parse(service.price);
      }
      return isContain;
    }).toList();
  }
}
