part of 'reviews_cubit.dart';

sealed class ReviewsState extends Equatable {
  const ReviewsState();

  @override
  List<Object> get props => [];
}

// reviews screen
final class ReviewsInitial extends ReviewsState {}

final class LoadingReviewsState extends ReviewsState {}

final class SuccessReviewsState extends ReviewsState {
  const SuccessReviewsState();
}

final class FailureReviewsState extends ReviewsState {
  final String message;
  const FailureReviewsState({required this.message});
}

// adding review dialog
final class LoadingAddingReviewState extends ReviewsState {}

final class SuccessAddingReviewState extends ReviewsState {}

final class FailureAddingReviewState extends ReviewsState {
  final String message;
  const FailureAddingReviewState({required this.message});
}
