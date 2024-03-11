import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CInfoContainer extends StatelessWidget {
  const CInfoContainer({super.key});

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
          Column(
            children: [
              Text(
                "3",
                style: CAppStyles.styleRegular14(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Bookings",
                style: CAppStyles.styleRegular12(context)
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
          Container(height: 30, width: 3, color: CColors.softGrey),
          Column(
            children: [
              Text(
                "5",
                style: CAppStyles.styleRegular14(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "Patients",
                style: CAppStyles.styleRegular12(context)
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
          Container(height: 30, width: 3, color: CColors.softGrey),
          Column(
            children: [
              Text(
                "20",
                style: CAppStyles.styleRegular14(context)
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Text(
                "reviews",
                style: CAppStyles.styleRegular12(context)
                    .copyWith(color: Colors.grey),
              ),
            ],
          ),
        ]),
      ),
    );
  }
}
