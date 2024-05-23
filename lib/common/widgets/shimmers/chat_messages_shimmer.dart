import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomChatMessagesLoadingShimmer extends StatelessWidget {
  const CustomChatMessagesLoadingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xFFF5F5F5),
      highlightColor: const Color(0xFFE0E0E0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: SingleChildScrollView(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Column(
              children: [
                ...List.generate(
                  3,
                  (index) => const CRoundedContainer(
                    height: 70,
                    width: 100,
                    radius: 5,
                    color: Colors.white,
                    margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                  ),
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CRoundedContainer(
                  height: 70,
                  width: 100,
                  radius: 5,
                  color: Colors.white,
                  margin: EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                ),
              ],
            )
          ]),
        ),
      ),
    );
  }
}
