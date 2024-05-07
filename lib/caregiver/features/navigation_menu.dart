import 'package:dochome/caregiver/features/bookings/screens/booking/booking.dart';
import 'package:dochome/caregiver/features/chat/screens/chats/chats.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/profile.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CCaregiverNavigationMenu extends StatefulWidget {
  const CCaregiverNavigationMenu({
    super.key,
  });
  @override
  State<CCaregiverNavigationMenu> createState() =>
      _CCaregiverNavigationMenuState();
}

class _CCaregiverNavigationMenuState extends State<CCaregiverNavigationMenu> {
  int selectedIndex = 0;
  List<Widget> screens = [
    const CaregiverBookingsScreen(),
    const CaregiverChatsScreen(),
    const CaregiverProfileScreen()
  ];
  List<String> labels = ['bookings', 'chats', "profile"];
  List<Widget> icons = [
    SvgPicture.asset(
      CImages.bookings,
      color: Colors.black,
    ),
    const Icon(Icons.chat_bubble_outline_rounded),
    const Icon(Icons.person_outline)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xffEBF1F0),
        height: 65,
        destinations: List.generate(
          screens.length,
          (i) => NavigationDestination(
            icon: icons[i],
            label: labels[i],
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
