part of 'auth_bloc.dart';

sealed class CaregiverAuthState extends Equatable {
  const CaregiverAuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends CaregiverAuthState {}

final class LoadingState extends CaregiverAuthState {}

final class LoadingDropDowns extends CaregiverAuthState {}

final class SuccessLoginCaregiver extends CaregiverAuthState {
  final String message;
  final Caregiver? caregiver;
  const SuccessLoginCaregiver({required this.message, this.caregiver});

  @override
  List<Object> get props => [message];
}

final class SuccessRegisterCaregiver extends CaregiverAuthState {
  final String message;
  const SuccessRegisterCaregiver({required this.message});

  @override
  List<Object> get props => [message];
}

final class SuccessLoadingCenters extends CaregiverAuthState {
  const SuccessLoadingCenters();
  @override
  List<Object> get props => [];
}

final class SuccessLoadingCategories extends CaregiverAuthState {
  const SuccessLoadingCategories();

  @override
  List<Object> get props => [];
}

final class FailureState extends CaregiverAuthState {
  final String message;
  const FailureState({required this.message});

  @override
  List<Object> get props => [message];
}
