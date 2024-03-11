import 'package:dochome/utils/constants/colors.dart';
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
    const SizedBox(),
    const SizedBox(),
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
            icon: SvgPicture.asset(
                'assets/images/streamline_waiting-appointments-calendar.svg'),
            selectedIcon: SvgPicture.asset(
                'assets/images/streamline_waiting-appointments-calendar.svg'),
            label: 'Booking',
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
