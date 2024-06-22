import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';

class CaregiversCubit extends Cubit<CaregiversState> {
  final FindCaregiverRepo findCaregiverRepo;
  CaregiversCubit(this.findCaregiverRepo) : super(CaregiverInitial());
  static CaregiversCubit get(context) => BlocProvider.of(context); 
  late Caregiver selectedCaregiver;
  Future<void> getAllCaregivers({int? id}) async {
    emit(CaregiverLoading());

    var result = await findCaregiverRepo.getAllCaregiversInCategory(id: id);
    result.fold(
        (failure) => {
              emit(CaregiverFailure(errorMsg: failure.message)),
            },
        (caregivers) => {
              emit(CaregiverSuccess(caregivers: caregivers)),
            });
  }
}
