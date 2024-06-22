import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomPatientBookingsShimmer extends StatelessWidget {
  const CustomPatientBookingsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Shimmer.fromColors(
          baseColor: CColors.shimmerBaseColor,
          highlightColor: CColors.shimmerHighlightColor,
          child: Column(
            children: List.generate(
              3,
              (index) => const CRoundedContainer(
                height: 200,
                radius: 5,
                color: Colors.white,
                margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
