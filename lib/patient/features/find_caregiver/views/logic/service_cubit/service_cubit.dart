import 'package:bloc/bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:equatable/equatable.dart';

part 'service_state.dart';

class ServiceCubit extends Cubit<ServiceState> {
  final FindCargiverRepo findCargiverRepo;
  ServiceCubit(
    this.findCargiverRepo,
  ) : super(ServiceInitial());

  Future<void> getAllServices({int? id}) async {
    emit(ServiceLoding());

    var result = await findCargiverRepo.getAllServicesinCategory(id: id);
// print(result.toString());
    result.fold(
        (failure) => {
              emit(ServiceFailure(errorMasege: failure.message)),
            },
        (service) => {
              emit(ServiceSuccess(services: service)),
            });
  }
}
