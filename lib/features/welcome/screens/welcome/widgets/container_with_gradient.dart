import 'package:dochome/features/welcome/screens/welcome/widgets/welcome_text.dart';
import 'package:flutter/material.dart';

class CContainerWithGradient extends StatelessWidget {
  const CContainerWithGradient({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 50),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF000000).withOpacity(.1),
            const Color(0xff040404)
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: const CWelcomeText()
    );
  }
}
