import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'onboarding_state.dart';

class OnBoardingCubit extends Cubit<OnBoardingState> {
  OnBoardingCubit() : super(OnBoardingState.initial);
  PageController pageController = PageController();
  int currentPage = 0;
  //? on click next button
  void goToNextScreen() {
    currentPage++;
    pageController.animateToPage(currentPage,curve: Curves.linear, duration: const Duration(milliseconds: 500));
    if (currentPage == 2) {
      emit(OnBoardingState.completed);
    } else {
      emit(OnBoardingState.pageChanged);
    }
  }

  //? on slide the screen
  void changePage(int pageIndex) {
    currentPage = pageIndex;
    if (currentPage == 2) {
      emit(OnBoardingState.completed);
    } else {
      emit(OnBoardingState.pageChanged);
      emit(OnBoardingState.initial);
    }
  }
}
