part of 'cargiver_cubit.dart';

sealed class CargiverState extends Equatable {
  const CargiverState();

  @override
  List<Object> get props => [];
}

final class CargiverInitial extends CargiverState {}

final class CargiverLoding extends CargiverState {}

final class CargiverSuccess extends CargiverState {
  final List<CargiverModel> cargivers;

  const CargiverSuccess({required this.cargivers});
}

final class CargiverFailure extends CargiverState {
  final String errorMasege;

  const CargiverFailure({required this.errorMasege});
}
