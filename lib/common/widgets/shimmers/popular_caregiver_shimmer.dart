import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomPopularCaregiversLoadingShimmer extends StatelessWidget {
  const CustomPopularCaregiversLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CColors.shimmerBaseColor,
      highlightColor: CColors.shimmerHighlightColor,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        CRoundedContainer(
          height: 50,
          width: 180,
          radius: 5,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
        ),
        CRoundedContainer(
          height: 100,
          radius: 5,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
        ),
      ]),
    );
  }
}
