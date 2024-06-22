import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'popular_caregivers_state.dart';

class PopularCaregiversCubit extends Cubit<PopularCaregiversState> {
  PopularCaregiversCubit(this.homeRepo) : super(PopularCaregiversInitial());

  final HomeRepo homeRepo;

  static PopularCaregiversCubit get(context) => BlocProvider.of(context);

  Future<void> getAllPopularCaregivers() async {
    emit(PopularCaregiversLoading());
    final result = await homeRepo.getAllPopularCaregivers();
    // print(result.toString());
    result.fold(
        (failure) => {
              emit(PopularCaregiversFailure(errorMsg: failure.message)),
            },
        (popularCaregivers) => {
              emit(
                PopularCaregiversSuccess(popularCaregivers: popularCaregivers),
              ),
            });
  }
}
