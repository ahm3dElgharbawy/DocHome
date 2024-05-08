import 'package:dochome/patient/features/home/views/screens/notifications_screen.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CHomeAppBar extends StatelessWidget {
  const CHomeAppBar({super.key, this.padding = EdgeInsets.zero});
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
              borderRadius: BorderRadiusDirectional.circular(88),
              color: const Color(0xffEBF1F0),
            ),
            child: Center(
              child: SvgPicture.asset('assets/images/account.svg'),
            ),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(88),
                color: const Color(0xffEBF1F0)),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return const NotificationsScreen();
                  }),
                );
              },
              child: const Center(
                child: Icon(
                  Icons.notifications,
                  size: 28,
                  color: CColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
