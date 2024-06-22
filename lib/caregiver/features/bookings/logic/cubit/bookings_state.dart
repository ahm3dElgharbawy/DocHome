part of 'bookings_cubit.dart';

sealed class CaregiverBookingsState extends Equatable {
  const CaregiverBookingsState();

  @override
  List<Object> get props => [];
}

final class BookingsInitial extends CaregiverBookingsState {}

class LoadingCaregiverBookingsState extends CaregiverBookingsState {}

class SuccessCaregiverBookingsState extends CaregiverBookingsState {}

class FailureCaregiverBookingsState extends CaregiverBookingsState {
  final String message;
  const FailureCaregiverBookingsState({required this.message});
}

// accept or reject booking
class LoadingCancelBookingState extends CaregiverBookingsState {}
class LoadingAcceptBookingState extends CaregiverBookingsState {}
class SuccessCancelBookingState extends CaregiverBookingsState {}
class SuccessAcceptBookingState extends CaregiverBookingsState {}

class FailureAcceptOrCancelBookingState extends CaregiverBookingsState {
  final String message;
  const FailureAcceptOrCancelBookingState({required this.message});
}

// make report

class LoadingReportState extends CaregiverBookingsState {}

class SuccessReportState extends CaregiverBookingsState {}

class FailureReportState extends CaregiverBookingsState {
  final String message;
  const FailureReportState({required this.message});
}