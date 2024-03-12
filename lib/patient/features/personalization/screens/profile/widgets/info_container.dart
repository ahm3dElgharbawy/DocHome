import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/profile/info_key_and_value.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CPatientInfoContainer extends StatelessWidget {
  const CPatientInfoContainer({super.key});
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 210,
      left: 0,
      right: 0,
      child: CRoundedContainer(
        height: null,
        radius: 20,
        margin: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
          const CInfoKeyAndValue(value: 3, k: "Bookings"),
          Container(height: 30, width: 3, color: CColors.softGrey),
          const CInfoKeyAndValue(value: 2, k: "Caregivers"),
          Container(height: 30, width: 3, color: CColors.softGrey),
          const CInfoKeyAndValue(value: 10, k: "Reviews"),
        ]),
      ),
    );
  }
}
