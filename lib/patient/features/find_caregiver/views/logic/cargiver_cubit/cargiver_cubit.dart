import 'package:bloc/bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:equatable/equatable.dart';

part 'cargiver_state.dart';

class CargiverCubit extends Cubit<CargiverState> {
  final FindCargiverRepo findCargiverRepo;
  CargiverCubit(this.findCargiverRepo) : super(CargiverInitial());

  Future<void> getAllCargivers({int? id}) async {
    emit(CargiverLoding());

    var result = await findCargiverRepo.getAllCaregiversinCategory(id: id);
// print(result.toString());
    result.fold(
        (failure) => {
              emit(CargiverFailure(errorMasege: failure.message)),
            },
        (cargivers) => {
              emit(CargiverSuccess(cargivers: cargivers)),
            });
  }
}
