import 'dart:convert';

import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/review_model.dart';
import 'package:equatable/equatable.dart';

part 'reviews_state.dart';

class ReviewsCubit extends Cubit<ReviewsState> {
  ReviewsCubit() : super(ReviewsInitial());
  static ReviewsCubit get(context) => BlocProvider.of(context);
  late List<ReviewModel> reviews;
  final commentController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  double rating = 5;
  getAllCaregiverReviews(int caregiverId) async {
    emit(LoadingReviewsState());
    final result = await ResponseHandler.handle(
      () => ApiCalls.getData(
        EndPoints.caregiverRatings(caregiverId),
      ),
    );
    emit(
      result.fold(
        (failure) => FailureReviewsState(message: failure.message),
        (response) {
          List data = jsonDecode(response.body);
          reviews = data.map((r) => ReviewModel.fromJson(r)).toList();
          return const SuccessReviewsState();
        },
      ),
    );
  }

  makeReview(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      emit(LoadingAddingReviewState());
      // await post(Uri.parse(EndPoints.addRating),body: {
      //   "caregiver_id": CaregiversCubit.get(context).selectedCaregiver.id,
      //   "rating": rating,
      //   "comments": commentController.text,
      // });
      final result = await ResponseHandler.handle(
        () => ApiCalls.postData(EndPoints.addRating, {
          "caregiver_id": CaregiversCubit.get(context).selectedCaregiver.id,
          "rating": rating,
          "comments": commentController.text,
        }),
      );
      emit(
        result.fold(
          (failure) => FailureAddingReviewState(message: failure.message),
          (response) {
            commentController.clear();
            return SuccessAddingReviewState();
          },
        ),
      );
    }
  }
}
