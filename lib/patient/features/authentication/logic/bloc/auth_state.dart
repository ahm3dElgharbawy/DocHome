part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {}
// login
final class LoginPatientLoadingState extends AuthState {}

final class LoginPatientSuccessState extends AuthState {
  final String message;
  final Patient patient;
  const LoginPatientSuccessState(
      {required this.message, required this.patient});
  @override
  List<Object> get props => [message, patient];
}

final class LoginPatientFailureState extends AuthState {
  final String message;
  const LoginPatientFailureState({required this.message});
}

// register
final class RegisterPatientLoadingState extends AuthState {}

final class RegisterPatientSuccessState extends AuthState {}

final class RegisterPatientFailureState extends AuthState {
  final String message;
  const RegisterPatientFailureState({required this.message});
}

// loading center
final class LoadingCentersState extends AuthState {}

final class SuccessLoadingCentersState extends AuthState {
  final List<CenterModel> centers;
  const SuccessLoadingCentersState({required this.centers});
  @override
  List<Object> get props => [centers];
}
final class FailureLoadingCentersState extends AuthState {
  final String message;
  const FailureLoadingCentersState({required this.message});
}
//##################
final class SendOtpLoadingState extends AuthState {}

final class SendOtpSuccessState extends AuthState {}

final class SendOtpFailureState extends AuthState {
  final String message;
  const SendOtpFailureState({required this.message});
}

// ###################3

final class CheckOtpLoadingState extends AuthState {}

final class CheckOtpSuccessState extends AuthState {}

final class CheckOtpFailureState extends AuthState {
  final String message;
  const CheckOtpFailureState({required this.message});
}
/// ###################3
final class ResetPasswordLoadingState extends AuthState {}

final class ResetPasswordSuccessState extends AuthState {}

final class ResetPasswordFailureState extends AuthState {
  final String message;
  const ResetPasswordFailureState({required this.message});
}
