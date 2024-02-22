import 'package:dochome/features/find_cargiver/screens/nursing_category.dart';
import 'package:dochome/features/home/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});
//
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doc Home',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Poppins",
          useMaterial3: false,
          scaffoldBackgroundColor: Colors.white),
      home: const NursingCategory(),
    );
  }
}
