part of 'notifications_cubit.dart';

sealed class NotificationsState extends Equatable {
  const NotificationsState();

  @override
  List<Object> get props => [];
}

final class NotificationsInitial extends NotificationsState {}

final class LoadingNotificationsState
    extends NotificationsState {}

final class SuccessNotificationsState
    extends NotificationsState {}

final class FailureNotificationsState extends NotificationsState {
  final String message;
  const FailureNotificationsState({required this.message});
}
