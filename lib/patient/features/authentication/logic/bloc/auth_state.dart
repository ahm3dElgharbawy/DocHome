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
  final Patient? data;
  const SuccessState({required this.message, this.data});

  @override
  List<Object> get props => [message];
}

final class FailureState extends AuthState {
  final String message;
  const FailureState({required this.message});

  @override
  List<Object> get props => [message];
}
