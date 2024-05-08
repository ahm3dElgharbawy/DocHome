import 'package:dochome/patient/features/home/views/screens/home.dart';
import 'package:dochome/patient/features/intro/screens/continue_as/continue_as.dart';
import 'package:dochome/patient/features/intro/screens/onboarding/onboarding.dart';
import 'package:dochome/patient/features/intro/screens/welcome/widgets/container_with_gradient.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    waitAndGo(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(CImages.welcome), fit: BoxFit.cover),
        ),
        child: const CContainerWithGradient(),
      ),
    );
  }

  void waitAndGo(context) {
    Future.delayed(const Duration(seconds: 3), () async {
      int? currentStep = await PreferenceServices.getInt("STEP") ?? 0;
      final page = currentStep == 0
          ? const OnBoardingScreen()
          : (currentStep == 1)
              ? const ContinueAsScreen()
              : const Home();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => page),
      );
    });
  }
}
