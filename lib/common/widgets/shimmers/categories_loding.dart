import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CategoryShimmerLoading extends StatelessWidget {
  const CategoryShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[300]!,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
          CategoryShimmerLoadingItem(),
          SizedBox(
            width: 20,
          ),
          CategoryShimmerLoadingItem(),
          SizedBox(
            width: 20,
          ),
          CategoryShimmerLoadingItem(),
          SizedBox(
            width: 20,
          ),
          CategoryShimmerLoadingItem(),
        ],
      ),
    );
  }
}

class CategoryShimmerLoadingItem extends StatelessWidget {
  const CategoryShimmerLoadingItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: AspectRatio(
          aspectRatio: 4 / 4,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.4),
            ),
          ),
        ),
      ),
    );
  }
}
