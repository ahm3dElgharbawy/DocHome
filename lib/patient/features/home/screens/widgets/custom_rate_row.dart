import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class CustomRateRow extends StatelessWidget {
  const CustomRateRow(
      {super.key,
      required this.reviews,
      required this.rating,
      this.iconSize = 20,
      required this.fontSize,
      this.onTap});

  final int reviews;
  final double rating;
  final double iconSize;
  final double fontSize;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.builder(
          initialRating: rating,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: const EdgeInsets.symmetric(horizontal: 2),
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            color: Colors.amber,
          ),
          itemSize: iconSize,
          ignoreGestures: true,
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        const SizedBox(
          width: 8,
        ),
        onTap != null
            ? TextButton(
                onPressed: onTap,
                // style: TextButton.styleFrom(padding: EdgeInsets.zero),
                child: Text(
                  '$rating | $reviews ${'Reviews'.tr}',
                  style: TextStyle(fontSize: fontSize),
                ),
              )
            : Text(
                '$rating | $reviews ${'Reviews'.tr}',
                style: TextStyle(fontSize: fontSize),
              ),
      ],
    );
  }
}
