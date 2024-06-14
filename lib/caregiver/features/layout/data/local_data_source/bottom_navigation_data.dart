import 'package:dochome/caregiver/features/bookings/screens/booking/booking.dart';
import 'package:dochome/common/models/bottom_navigation_bar_item_model.dart';
import 'package:dochome/caregiver/features/personalization/screens/profile/profile.dart';
import 'package:dochome/components/chat/screens/chats/chats.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CaregiverBottomNavigationBarData {
  static List<BottomNavigationBarItemModel> get get => [
        BottomNavigationBarItemModel(
          title: 'bookings',
          screen: const CaregiverBookingsScreen(),
          icon: SvgPicture.asset(
            CImages.bookings,
            colorFilter: const ColorFilter.mode(Colors.black, BlendMode.color),
          ),
        ),
        const BottomNavigationBarItemModel(
          title: 'chats',
          screen: ChatsScreen(userType: UserType.caregiver,),
          icon: Icon(Icons.chat_bubble_outline_rounded),
        ),
        const BottomNavigationBarItemModel(
          title: 'profile',
          screen: CaregiverProfileScreen(),
          icon: Icon(Icons.person_outline),
        ),
      ];
}
