part of 'onboarding_cubit.dart';

@immutable
sealed class OnboardingState {}

final class OnboardingInitial extends OnboardingState {}

final class OnboardingChangedState extends OnboardingState {
  final int pageIndex;
  OnboardingChangedState({required this.pageIndex});
}