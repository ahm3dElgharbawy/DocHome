part of 'popular_caregivers_cubit.dart';

sealed class PopularCaregiversState extends Equatable {
  const PopularCaregiversState();

  @override
  List<Object> get props => [];
}

final class PopularCaregiversInitial extends PopularCaregiversState {}

// popular caregivers
final class PopularCaregiversLoading extends PopularCaregiversState {}

final class PopularCaregiversSuccess extends PopularCaregiversState {
  final List<Caregiver> popularCaregivers;
  const PopularCaregiversSuccess({required this.popularCaregivers});
}

final class PopularCaregiversFailure extends PopularCaregiversState {
  final String errorMsg;
  const PopularCaregiversFailure({required this.errorMsg});
}
