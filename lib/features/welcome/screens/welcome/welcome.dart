import 'package:dochome/features/welcome/screens/onboarding/onboarding.dart';
import 'package:dochome/features/welcome/screens/welcome/widgets/container_with_gradient.dart';
import 'package:dochome/utils/constants/image_strings.dart';
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
    waitAndGo(context);
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
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const OnBoardingScreen()),
      );
    });
  }
}
