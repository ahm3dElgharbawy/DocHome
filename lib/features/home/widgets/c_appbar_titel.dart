import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CAppBarTitel extends StatelessWidget {
  const CAppBarTitel({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(88),
                color: const Color(0xffEBF1F0)),
            child:
                Center(child: SvgPicture.asset('assets/images/account.svg'))),
        Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(88),
                color: const Color(0xffEBF1F0)),
            child: const Center(
                child: Icon(
              Icons.notifications,
              size: 28,
              color: CColors.primary,
            ))),
      ],
    );
  }
}
