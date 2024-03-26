import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


part 'onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitial());
  int currentPageIndex = 0;
  final pageController = PageController();

  gotTo(int index){
    currentPageIndex = index;
    pageController.animateToPage(index,duration: const Duration(milliseconds: 500),curve: Curves.linear);
    emit(OnboardingChangedState(pageIndex: index));
  }

}
