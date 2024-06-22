import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomCaregiverBookingsShimmer extends StatelessWidget {
  const CustomCaregiverBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: CColors.shimmerBaseColor,
      highlightColor: CColors.shimmerHighlightColor,
      child: ListView.builder(
        padding: const EdgeInsets.only(
          left: CSizes.defaultSpace,
          right: CSizes.defaultSpace,
        ),
        itemCount: 3,
        itemBuilder: (context, index) => const CRoundedContainer(
          height: 150,
          radius: 15,
          color: Colors.white,
          margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
        ),
      ),
    );
  }
}
