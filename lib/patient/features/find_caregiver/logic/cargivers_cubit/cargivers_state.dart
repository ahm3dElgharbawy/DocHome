import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:equatable/equatable.dart';

sealed class CaregiversState extends Equatable {
  const CaregiversState();

  @override
  List<Object> get props => [];
}

final class CaregiverInitial extends CaregiversState {}

final class CaregiverLoading extends CaregiversState {}

final class CaregiverSuccess extends CaregiversState {
  final List<Caregiver> caregivers;

  const CaregiverSuccess({required this.caregivers});
}

final class CaregiverFailure extends CaregiversState {
  final String errorMsg;

  const CaregiverFailure({required this.errorMsg});
}
