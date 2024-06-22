import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:dochome/components/chat/screens/chats/chats.dart';
import 'package:dochome/patient/features/bookings/screens/bookings/bookings.dart';
import 'package:dochome/patient/features/home/screens/home_screen.dart';
import 'package:dochome/patient/features/personalization/screens/profile/patient_profile.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class PatientBottomNavigationBarData {
  static List<BottomNavigationBarItemModel> get get => [
        BottomNavigationBarItemModel(
          title: 'Home'.tr,
          screen: const HomeScreen(),
          icon: const Icon(
            Icons.home_outlined,
            color: CColors.primary,
          ),
          activeIcon: const Icon(
            Icons.home,
            color: CColors.primary,
          ),
        ),
        BottomNavigationBarItemModel(
          title: 'Bookings'.tr,
          screen: const PatientBookingsScreen(),
          icon: const Icon(
            Icons.local_hospital_outlined,
            color: CColors.primary,
          ),
          activeIcon: const Icon(
            Icons.local_hospital,
            color: CColors.primary,
          ),
        ),
        BottomNavigationBarItemModel(
          title: 'Chats'.tr,
          screen: const ChatsScreen(userType: UserType.patient),
          icon: const Icon(
            Icons.chat_bubble_outline_rounded,
            color: CColors.primary,
          ),
          activeIcon: const Icon(
            Icons.chat_bubble,
            color: CColors.primary,
          ),
        ),
        BottomNavigationBarItemModel(
          title: 'Profile'.tr,
          screen: const PatientProfileScreen(),
          icon: const Icon(
            Icons.person_outline_outlined,
            color: CColors.primary,
          ),
          activeIcon: const Icon(
            Icons.person,
            color: CColors.primary,
          ),
        ),
      ];
}
