import 'package:dochome/patient/features/bookings/screens/booking_screen/bookingScreen.dart';
import 'package:dochome/patient/features/chat/screens/chats/chats.dart';
import 'package:dochome/patient/features/personalization/screens/profile/profile.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'home_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  final pages = [
    const HomeScreen(),
    const PatientBookingsScreen(),
    const PatientChatsScreen(),
    const PatientProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        backgroundColor: const Color(0xffEBF1F0),
        height: 65,
        destinations: [
          const NavigationDestination(
            icon: Icon(
              Icons.home_outlined,
              color: CColors.primary,
            ),
            selectedIcon: Icon(
              Icons.home,
              color: CColors.primary,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: SvgPicture.asset(CImages.bookings),
            selectedIcon: SvgPicture.asset(CImages.bookings),
            label: 'Bookings',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: CColors.primary,
            ),
            selectedIcon: Icon(
              Icons.chat_bubble,
              color: CColors.primary,
            ),
            label: 'chats',
          ),
          const NavigationDestination(
            icon: Icon(
              Icons.person_outline_outlined,
              color: CColors.primary,
            ),
            selectedIcon: Icon(
              Icons.person,
              color: CColors.primary,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
