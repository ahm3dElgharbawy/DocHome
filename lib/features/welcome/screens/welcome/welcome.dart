import 'package:dochome/features/welcome/screens/welcome/widgets/container_with_gredient.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(CImages.welcome), fit: BoxFit.cover),
        ),
        child: const CContainerWithGradient()
      ),
    );
  }
}
