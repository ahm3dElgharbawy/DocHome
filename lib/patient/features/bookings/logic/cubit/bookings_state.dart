part of 'bookings_cubit.dart';

sealed class BookingsState extends Equatable {
  const BookingsState();

  @override
  List<Object> get props => [];
}

final class BookingsInitial extends BookingsState {}
class LoadingBookingsState extends BookingsState {}
class SuccessBookingsState extends BookingsState {}
class FailureBookingsState extends BookingsState {
  final String message;
  const FailureBookingsState({required this.message});
}


class CancelBookingLoadingState extends BookingsState {}
class CancelBookingSuccessState extends BookingsState {}
class CancelBookingFailureState extends BookingsState {}


