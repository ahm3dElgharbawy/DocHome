import 'package:dochome/caregiver/features/layout/data/local_data_source/bottom_navigation_data.dart';
import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:flutter/material.dart';

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
  List<BottomNavigationBarItemModel> items = CaregiverBottomNavigationBarData.get;
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
          items.length,
          (i) => NavigationDestination(
            icon: items[i].icon,
            label: items[i].title,
          ),
        ),
      ),
      body: items[selectedIndex].screen,
    );
  }
}
