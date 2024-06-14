import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:dochome/patient/features/layout/data/local_data_source/patient_bottom_navigation_data.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;

  List<BottomNavigationBarItemModel> items = PatientBottomNavigationBarData.get;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: items[index].screen,
      bottomNavigationBar: NavigationBar(
        selectedIndex: index,
        onDestinationSelected: (index) => setState(() {
          this.index = index;
        }),
        backgroundColor: const Color(0xffEBF1F0),
        height: 65,
        destinations: List.generate(
          items.length,
          (index) => NavigationDestination(
            icon: items[index].icon,
            selectedIcon: items[index].activeIcon,
            label: items[index].title,
          ),
        ),
      ),
    );
  }
}
