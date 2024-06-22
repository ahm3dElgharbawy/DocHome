import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/common/widgets/dialogs/dialog.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/rating_stars.dart';
import 'package:dochome/common/widgets/text_fields/normal_text_field.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/reviews_cubit/reviews_cubit.dart';
import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddReview extends StatelessWidget {
  const AddReview({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = ReviewsCubit.get(context);
    final caregiver = CaregiversCubit.get(context)
                            .selectedCaregiver;
    return FloatingActionButton(
      backgroundColor: CColors.primary,
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              Form(
                key: cubit.formKey,
                child: Column(
                  children: [
                    CCircularContainer(
                      height: 50,
                      width: 50,
                      backgroundImage: CachedNetworkImageProvider(
                        caregiver.profileImage.asLink(),
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    Text(
                      caregiver.name,
                      style: CAppStyles.styleMedium15(context),
                    ),
                    const Divider(
                      height: 50,
                    ),
                    RatingStarsWidget(
                      onRatingUpdate: (rat) {
                        cubit.rating = rat;
                      },
                      ignoreGestures: false,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                    NormalTextField(
                      hintText: "Comments".tr,
                      controller: cubit.commentController,
                      validator: (p0) =>
                          CTextFieldValidator.requiredTextField(p0),
                          expanded: true,
                    ),
                    const SizedBox(
                      height: CSizes.spaceBtwItems,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: OutlinedButton(
                              onPressed: () {
                                context.pop();
                              },
                              style: OutlinedButton.styleFrom(
                                backgroundColor: Colors.red,
                                foregroundColor: Colors.white,
                              ),
                              child: Text("Cancel".tr),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: CSizes.spaceBtwItems,
                        ),
                        Expanded(
                          child: SizedBox(
                            height: 40,
                            child: BlocConsumer<ReviewsCubit, ReviewsState>(
                              listener: (context, state) {
                                if (state is SuccessAddingReviewState) {
                                  "Review Submitted Successfully".tr
                                      .showAsToast(Colors.green);
                                  context.pushReplacementAll(
                                      const PatientLayoutScreen());
                                } else if (state
                                    is FailureAddingReviewState) {
                                  state.message
                                      .showAsToast(Colors.red);
                                }
                              },
                              builder: (context, state) {
                                if (state is LoadingAddingReviewState) {
                                  return ElevatedButton(
                                    onPressed: () {},
                                    child: const SizedBox(height: 25,width: 25,child: CLoadingWidget(indicatorColor: Colors.white)),
                                  );
                                }
                                return ElevatedButton(
                                  onPressed: () {
                                    ReviewsCubit.get(context)
                                        .makeReview(context);
                                  },
                                  child: Text("Submit".tr),
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ]),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }
}
