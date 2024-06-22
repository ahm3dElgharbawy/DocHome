import 'package:dochome/caregiver/features/layout/data/local_data_source/bottom_navigation_data.dart';
import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:flutter/material.dart';

class CaregiverLayoutScreen extends StatefulWidget {
  const CaregiverLayoutScreen({
    super.key, this.initialIndex = 0,
  });
  final int initialIndex;
  @override
  State<CaregiverLayoutScreen> createState() =>
      _CaregiverLayoutScreenState();
}

class _CaregiverLayoutScreenState extends State<CaregiverLayoutScreen> {
  late int selectedIndex;
  List<BottomNavigationBarItemModel> items = CaregiverBottomNavigationBarData.get;
  @override
  void initState() {
    selectedIndex = widget.initialIndex;
    super.initState();
  }
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
            selectedIcon: items[i].activeIcon,
            label: items[i].title,

          ),
        ),
      ),
      body: items[selectedIndex].screen,
    );
  }
}
