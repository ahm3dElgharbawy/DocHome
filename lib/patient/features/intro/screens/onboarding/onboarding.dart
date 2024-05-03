import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/patient/features/intro/logic/cubit/onboarding_cubit.dart';
import 'package:dochome/patient/features/intro/screens/continue_as/continue_as.dart';
import 'package:dochome/patient/features/intro/screens/onboarding/widgets/page_indicators.dart';
import 'package:dochome/patient/features/intro/screens/onboarding/widgets/slider.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        body: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
            final onBoardingCubit = BlocProvider.of<OnboardingCubit>(context);
            return Container(
              height: double.infinity,
              width: double.infinity,
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                Expanded(
                  child: COnBoardingSlider(
                    pageController: onBoardingCubit.pageController,
                    onPageChanged: (i) {
                      onBoardingCubit.gotTo(i);
                    },
                  ),
                ),
                CPageIndicators(
                  activeDot: onBoardingCubit.currentPageIndex,
                ),
                state is OnboardingChangedState
                    ? CRoundedButton(
                        title: state.pageIndex == 2
                            ? "Start".tr(context)
                            : "Next".tr(context),
                        onPressed: state.pageIndex == 2
                            ? () {
                                PreferenceServices.setInt("STEP", 1); // To ignore onboarding next time
                                //? navigate to continue as screen
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const ContinueAsScreen(),
                                  ),
                                );
                              }
                            : () {
                                onBoardingCubit.gotTo(state.pageIndex + 1);
                              })
                    : CRoundedButton(
                        title: "Next".tr(context),
                        onPressed: () {
                          onBoardingCubit.gotTo(1);
                        })
              ]),
            );
          },
        ),
      ),
    );
  }
}
