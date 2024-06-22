import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/patient/features/find_caregiver/logic/reviews_cubit/reviews_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/reviews/widgets/add_review.dart';
import 'package:dochome/patient/features/find_caregiver/screens/reviews/widgets/review_card.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ReviewsScreen extends StatefulWidget {
  const ReviewsScreen(
      {super.key, required this.caregiverId, required this.stars});
  final int caregiverId;
  final double stars;

  @override
  State<ReviewsScreen> createState() => _ReviewsScreenState();
}

class _ReviewsScreenState extends State<ReviewsScreen> {
  @override
  void initState() {
    super.initState();
    ReviewsCubit.get(context).getAllCaregiverReviews(widget.caregiverId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(title: "Caregivers Reviews".tr),
      floatingActionButton: const AddReview(),
      body: BlocConsumer<ReviewsCubit, ReviewsState>(
        listener: (context, state) {
          if (state is FailureReviewsState) {
            "Failure loading reviews".tr.showAsToast(Colors.red);
          }
        },
        builder: (context, state) {
          final cubit = ReviewsCubit.get(context);
          if (state is LoadingReviewsState) {
            return const CLoadingWidget(
              indicatorColor: CColors.primary,
            );
          } else if (state is FailureReviewsState) {
            return const SizedBox();
          }
          return SizedBox(
            child: SingleChildScrollView(
              child: SizedBox(
                width: context.width,
                child: Padding(
                  padding: const EdgeInsets.all(CSizes.defaultSpace),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Overall Rating".tr,
                        style: CAppStyles.styleMedium15(context),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItems),
                      RatingBar.builder(
                        initialRating: widget.stars,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: true,
                        itemCount: 5,
                        itemPadding: const EdgeInsets.symmetric(horizontal: 2),
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        itemSize: 30,
                        ignoreGestures: true,
                        onRatingUpdate: (r){},
                      ),
                      Text(
                        widget.stars.toString(),
                        style: const TextStyle(
                            fontSize: 80, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: CSizes.spaceBtwItems),
                      Text("${'Based on'.tr} ${cubit.reviews.length} ${'reviews'.tr}",
                          style: CAppStyles.styleRegular14(context)),
                      const SizedBox(height: CSizes.spaceBtwSections * 3),
                      ...List.generate(
                        cubit.reviews.length,
                        (index) {
                          final review = cubit.reviews[index];
                          return ReviewCardWidget(
                            patient: review.user,
                            comments: review.comments,
                            rating: review.rating,
                          );
                        },
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
