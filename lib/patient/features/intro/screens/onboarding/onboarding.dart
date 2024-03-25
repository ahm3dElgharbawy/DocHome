import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/intro/logic/onboarding/onboarding_cubit.dart';
import 'package:dochome/patient/features/intro/logic/onboarding/onboarding_state.dart';
import 'package:dochome/patient/features/intro/screens/continue_as/continue_as.dart';
import 'package:dochome/patient/features/intro/screens/onboarding/widgets/page_indicators.dart';
import 'package:dochome/patient/features/intro/screens/onboarding/widgets/slider.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnBoardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnBoardingCubit, OnBoardingState>(
          builder: (context, state) {
            final onBoardingCubit = BlocProvider.of<OnBoardingCubit>(context);
            return Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                  child: COnBoardingSlider(
                    pageController: onBoardingCubit.pageController,
                    onPageChanged: (i) {
                      onBoardingCubit.changePage(i);
                    },
                  ),
                ),
                CPageIndicators(
                  activeDot: onBoardingCubit.currentPage,
                ),
                state == OnBoardingState.completed
                    ? CRoundedButton(
                        title: "Start".tr(context),
                        onPressed: () {
                          //? navigate to continue as screen
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> const ContinueAsScreen()));
                        })
                    : CRoundedButton(
                        title: "Next".tr(context),
                        onPressed: () {
                          onBoardingCubit.goToNextScreen();
                        })
              ]),
            );
          },
        ),
      ),
    );
  }
}