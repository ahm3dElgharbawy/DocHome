part of 'location_cubit.dart';

sealed class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

final class LocationInitial extends LocationState {}
final class LocationLoading extends LocationState {
  const LocationLoading();
}
final class LocationSuccess extends LocationState {
  const LocationSuccess();
}
final class LocationFailure extends LocationState {
  final String message;
  const LocationFailure({required this.message});
}
