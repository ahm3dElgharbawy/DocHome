import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomChatsLoadingShimmer extends StatelessWidget {
  const CustomChatsLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Column(
        children: List.generate(
          3,
          (index) => const CRoundedContainer(
            height: 70,
            radius: 5,
            color: Colors.white,
            margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
          ),
        ),
      ),
    );
  }
}
