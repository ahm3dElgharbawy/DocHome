import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RatingStarsWidget extends StatelessWidget {
  const RatingStarsWidget(
      {super.key,
      this.initialRating = 5,
      this.itemSize = 30,
      required this.onRatingUpdate,
      this.ignoreGestures = true});
  final double initialRating;
  final double itemSize;
  final void Function(double) onRatingUpdate;
  final bool ignoreGestures;
  @override
  Widget build(BuildContext context) {
    return RatingBar.builder(
      initialRating: initialRating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemPadding: const EdgeInsets.symmetric(horizontal: 2),
      itemBuilder: (context, _) => const Icon(
        Icons.star_rounded,
        color: Colors.amber,
      ),
      itemSize: 30,
      glow: false,
      ignoreGestures: ignoreGestures,
      onRatingUpdate: onRatingUpdate,
    );
  }
}
