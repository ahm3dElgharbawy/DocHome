import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomStatisticShimmer extends StatelessWidget {
  const CustomStatisticShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CColors.shimmerBaseColor,
      highlightColor: CColors.shimmerHighlightColor,
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
        const CRoundedContainer(
          width: 50,
          height: 40,
          color: Colors.white,
        ),
        Container(height: 30, width: 3, color: CColors.softGrey),
        const CRoundedContainer(
          width: 50,
          height: 40,
          color: Colors.white
        ),
        Container(height: 30, width: 3, color: CColors.softGrey),
        const CRoundedContainer(
          width: 50,
          height: 40,
          color: Colors.white,
        ),
      ]),
    );
  }
}
