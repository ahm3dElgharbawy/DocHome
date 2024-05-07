part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}

final class LoadingState extends AuthState {}

final class LoginPatientLoadingState extends AuthState {}

final class RegisterPatientLoadingState extends AuthState {}

final class LoadingCentersState extends AuthState {}

final class LoadedCentersState extends AuthState {
  final List<CenterModel> centers;
  const LoadedCentersState({required this.centers});
  @override
  List<Object> get props => [centers];
}

final class SuccessState extends AuthState {
  final String message;
  const SuccessState({required this.message});

  @override
  List<Object> get props => [message];
}

final class SuccessLoginState extends AuthState {
  final String message;
  final Patient patient;
  const SuccessLoginState(
      {required this.message, required this.patient});
  @override
  List<Object> get props => [message, patient];
}

final class FailureState extends AuthState {
  final String message;
  const FailureState({required this.message});

  @override
  List<Object> get props => [message];
}
