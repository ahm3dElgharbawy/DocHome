import 'package:dochome/caregiver/features/bookings/screens/bookings/bookings.dart';
import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/caregiver_profile.dart';
import 'package:dochome/components/chat/screens/chats/chats.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class CaregiverBottomNavigationBarData {
  static List<BottomNavigationBarItemModel> get get => [
        BottomNavigationBarItemModel(
          title: 'Bookings'.tr,
          screen: const CaregiverBookingsScreen(),
          icon:
              const Icon(Icons.local_hospital_outlined, color: CColors.primary),
          activeIcon: const Icon(Icons.local_hospital, color: CColors.primary),
        ),
        BottomNavigationBarItemModel(
          title: 'Chats'.tr,
          screen: const ChatsScreen(userType: UserType.caregiver),
          icon: const Icon(Icons.chat_bubble_outline_rounded,
              color: CColors.primary),
          activeIcon: const Icon(Icons.chat_bubble, color: CColors.primary),
        ),
        BottomNavigationBarItemModel(
          title: 'Profile'.tr,
          screen: const CaregiverProfileScreen(),
          icon: const Icon(
            Icons.person_outline,
            color: CColors.primary,
          ),
          activeIcon: const Icon(Icons.person, color: CColors.primary),
        ),
      ];
}
