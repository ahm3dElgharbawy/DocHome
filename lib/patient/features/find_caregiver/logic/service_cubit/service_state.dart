part of 'service_cubit.dart';

sealed class ServiceState extends Equatable {
  const ServiceState();

  @override
  List<Object> get props => [];
}

final class ServiceInitial extends ServiceState {}

final class ServiceLoading extends ServiceState {}

final class ServiceSuccess extends ServiceState {
  final List<ServiceModel> services;

  const ServiceSuccess({required this.services});
}

final class ServiceFailure extends ServiceState {
  final String errorMsg;

  const ServiceFailure({required this.errorMsg});
}
