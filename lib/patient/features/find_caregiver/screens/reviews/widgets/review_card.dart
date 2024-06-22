import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewCardWidget extends StatelessWidget {
  const ReviewCardWidget(
      {super.key,
      required this.patient,
      required this.rating,
      required this.comments});
  final Patient patient;
  final num rating;
  final String comments;
  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      color: CColors.softGrey,
      radius: 10,
      centerChild: false,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CCircularContainer(
          backgroundImage:
              CachedNetworkImageProvider(patient.avatar!.asLink()),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: CSizes.sm),
          child: RatingBar.builder(
            initialRating: rating.toDouble(),
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: true,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 2),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
            itemSize: 15,
            ignoreGestures: true,
            onRatingUpdate: (rating) {
              print(rating);
            },
          ),
        ),
        Text(
          comments,
        )
      ]),
    );
  }
}
