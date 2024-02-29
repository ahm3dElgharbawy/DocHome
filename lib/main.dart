import 'package:dochome/features/find_cargiver/screens/booking_screen.dart';
import 'package:dochome/features/find_cargiver/screens/nursing/nursing_category.dart';
import 'package:dochome/features/find_cargiver/screens/nursing/nursing_stuff.dart';
import 'package:dochome/features/home/screens/home.dart';
import 'package:dochome/features/home/screens/notifications_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

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
      home: const Home(),
    //    initialRoute: '/Home',
    //   getPages: [
    //     GetPage(name: '/Home', page: () => Home()),
    //     GetPage(name: '/NursingCategory', page: () => NursingCategory()),
    //     GetPage(name: '/NursingStuff', page: () => NursingStuff()),
    //     GetPage(name: '/NotificationsScreen', page: () => NotificationsScreen()),
    //   ],
    );
  }
}
