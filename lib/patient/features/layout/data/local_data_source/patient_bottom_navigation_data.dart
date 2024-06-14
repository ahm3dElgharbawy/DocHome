import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:dochome/components/chat/screens/chats/chats.dart';
import 'package:dochome/patient/features/bookings/screens/booking_screen/bookingScreen.dart';
import 'package:dochome/patient/features/home/views/screens/home_screen.dart';
import 'package:dochome/patient/features/personalization/screens/profile/profile.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PatientBottomNavigationBarData {
  static List<BottomNavigationBarItemModel> get get => [
        const BottomNavigationBarItemModel(
          title: 'Home',
          screen: HomeScreen(),
          icon: Icon(
            Icons.home_outlined,
            color: CColors.primary,
          ),
          activeIcon: Icon(
            Icons.home,
            color: CColors.primary,
          ),
        ),
        BottomNavigationBarItemModel(
          title: 'Bookings',
          screen: const PatientBookingsScreen(),
          icon: SvgPicture.asset(CImages.bookings),
          activeIcon: SvgPicture.asset(CImages.bookings),
        ),
        const BottomNavigationBarItemModel(
          title: 'Chats',
          screen: ChatsScreen(userType: UserType.patient),
          icon: Icon(
            Icons.chat_bubble_outline_rounded,
            color: CColors.primary,
          ),
          activeIcon: Icon(
            Icons.chat_bubble,
            color: CColors.primary,
          ),
        ),
        const BottomNavigationBarItemModel(
          title: 'Profile',
          screen: PatientProfileScreen(),
          icon: Icon(
            Icons.person_outline_outlined,
            color: CColors.primary,
          ),
          activeIcon: Icon(
            Icons.person,
            color: CColors.primary,
          ),
        ),
      ];
}
