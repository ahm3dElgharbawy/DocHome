import 'package:dochome/patient/features/intro/screens/welcome/welcome.dart';
import 'package:dochome/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/app_localizations.dart';

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
      locale: const Locale('ar'), // Default local
      supportedLocales: const [Locale('en'), Locale('ar')],
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      theme: CAppTheme.lightTheme,
      home: const WelcomeScreen(),
    );
  }
}
