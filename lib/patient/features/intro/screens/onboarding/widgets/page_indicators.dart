import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CPageIndicators extends StatelessWidget {
  const CPageIndicators({super.key, required this.activeDot});
  final int activeDot;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSizes.spaceBtwItems),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: List.generate(
          3,
          (index) => AnimatedContainer(
            height: 10,
            width: activeDot == index ? 30 : 10,
            duration: const Duration(milliseconds: 500),
            margin: const EdgeInsets.only(right: 3),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: activeDot == index ? CColors.primary : CColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
