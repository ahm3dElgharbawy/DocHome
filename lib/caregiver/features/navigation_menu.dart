import 'package:dochome/caregiver/features/bookings/screens/booking/booking.dart';
import 'package:dochome/caregiver/features/chat/screens/chats/chats.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/profile.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CCaregiverNavigationMenu extends StatefulWidget {
  const CCaregiverNavigationMenu({
    super.key,
  });
  @override
  State<CCaregiverNavigationMenu> createState() => _CCaregiverNavigationMenuState();
}

class _CCaregiverNavigationMenuState extends State<CCaregiverNavigationMenu> {
  int selectedIndex = 0;
  List<Widget> screens  = [const BookingsScreen(),const CaregiverChatsScreen(),const CaregiverProfileScreen()];
  List<String> labels = ['bookings','chat',"profile"];
  List<IconData> icons = [Icons.library_books_outlined,Icons.chat_bubble, Icons.person];
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
            icon: Icon(icons[i]),
            label: labels[i],
            selectedIcon: Icon(
              icons[i],
              color: CColors.primary,
            ),
          ),
        ),
      ),
      body: screens[selectedIndex],
    );
  }
}
