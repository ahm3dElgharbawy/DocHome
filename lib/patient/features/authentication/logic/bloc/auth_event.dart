part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

// login patient
class LoginPatientEvent extends AuthEvent {
  final String email;
  final String password;
  const LoginPatientEvent({required this.email, required this.password});
}

// register patient
class RegisterPatientEvent extends AuthEvent {
  final Map<String, String> patientData;
  const RegisterPatientEvent({required this.patientData});
}

// send otp to email
class SendOtpEvent extends AuthEvent {
  final String email;
  const SendOtpEvent({required this.email});
  @override
  List<Object> get props => [email];
}

// resend otp to email
class ResendOtpEvent extends AuthEvent {
  final String email;
  const ResendOtpEvent({required this.email});
  @override
  List<Object> get props => [email];
}

// checking the otp
class CheckOtpEvent extends AuthEvent {
  final String otp;
  final String email;
  const CheckOtpEvent({required this.email, required this.otp});
  @override
  List<Object> get props => [otp];
}

// add new password
class ResetPasswordEvent extends AuthEvent {
  final String email;
  final String newPassword;
  const ResetPasswordEvent({required this.email, required this.newPassword});
  @override
  List<Object> get props => [newPassword];
}

class FetchCentersEvent extends AuthEvent {
  const FetchCentersEvent();
  @override
  List<Object> get props => [];
}
