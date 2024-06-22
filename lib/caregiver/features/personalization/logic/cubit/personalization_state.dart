part of 'personalization_cubit.dart';

sealed class CaregiverPersonalizationState extends Equatable {
  const CaregiverPersonalizationState();

  @override
  List<Object> get props => [];
}

final class CaregiverPersonalizationInitial extends CaregiverPersonalizationState {}

// statistics
final class LoadingCaregiverStatisticsState extends CaregiverPersonalizationState {}

final class SuccessLoadingCaregiverStatisticsState extends CaregiverPersonalizationState {
  final CaregiverProfileStatisticsModel statisticsModel;
  const SuccessLoadingCaregiverStatisticsState({required this.statisticsModel});
  @override
  List<Object> get props => [statisticsModel];
}

final class FailureLoadingCaregiverStatisticsState extends CaregiverPersonalizationState {}

// update profile
final class LoadingCaregiverUpdateProfileState extends CaregiverPersonalizationState {}

final class SuccessCaregiverUpdateProfileState extends CaregiverPersonalizationState {}

final class FailureCaregiverUpdateProfileState extends CaregiverPersonalizationState {}

// update password
final class LoadingCaregiverUpdatePasswordState extends CaregiverPersonalizationState {}

final class SuccessCaregiverUpdatePasswordState extends CaregiverPersonalizationState {}

final class FailureCaregiverUpdatePasswordState extends CaregiverPersonalizationState {}
