part of 'personalization_cubit.dart';

sealed class PatientPersonalizationState extends Equatable {
  const PatientPersonalizationState();

  @override
  List<Object> get props => [];
}

final class PersonalizationInitial extends PatientPersonalizationState {}

// statistics
final class LoadingStatisticsState extends PatientPersonalizationState {}

final class SuccessLoadingStatisticsState extends PatientPersonalizationState {
  final PatientProfileStatisticsModel statisticsModel;
  const SuccessLoadingStatisticsState({required this.statisticsModel});
  @override
  List<Object> get props => [statisticsModel];
}

final class FailureLoadingStatisticsState extends PatientPersonalizationState {}

// update profile
final class LoadingUpdateProfileState extends PatientPersonalizationState {}

final class SuccessUpdateProfileState extends PatientPersonalizationState {}

final class FailureUpdateProfileState extends PatientPersonalizationState {}

// update password
final class LoadingUpdatePasswordState extends PatientPersonalizationState {}

final class SuccessUpdatePasswordState extends PatientPersonalizationState {}

final class FailureUpdatePasswordState extends PatientPersonalizationState {}
