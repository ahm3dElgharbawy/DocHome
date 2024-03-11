import 'package:dochome/patient/features/welcome/screens/welcome/welcome.dart';
import 'package:dochome/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc Home',
      debugShowCheckedModeBanner: false,
      theme: CAppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
