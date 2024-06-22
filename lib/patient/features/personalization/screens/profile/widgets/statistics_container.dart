import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/profile/info_key_and_value.dart';
import 'package:dochome/common/widgets/shimmers/statistics_loading_shimmer.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CPatientStatisticsContainer extends StatelessWidget {
  const CPatientStatisticsContainer({super.key});
  @override
  Widget build(BuildContext context) {
    final cubit = PersonalizationCubit.get(context)..getStatistics();
    return Positioned(
      top: 210,
      left: 0,
      right: 0,
      child: CRoundedContainer(
        height: null,
        radius: 20,
        margin: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        color: Colors.white,
        padding: const EdgeInsets.all(20),
        child: BlocBuilder<PersonalizationCubit, PatientPersonalizationState>(
          builder: (context, state) {
            if (state is FailureLoadingStatisticsState) {
              return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CInfoKeyAndValue(value: 0, k: "Bookings".tr),
                    Container(height: 30, width: 3, color: CColors.softGrey),
                    CInfoKeyAndValue(value: 0, k: "Caregivers".tr),
                    Container(height: 30, width: 3, color: CColors.softGrey),
                    CInfoKeyAndValue(value: 0, k: "Reviews".tr),
                  ]);
            } else if (state is LoadingStatisticsState) {
              return const CustomStatisticShimmer();
            }
            return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CInfoKeyAndValue(
                      value: cubit.statistics.totalBookings, k: "Bookings".tr),
                  Container(height: 30, width: 3, color: CColors.softGrey),
                  CInfoKeyAndValue(
                      value: cubit.statistics.caregiverCount, k: "Caregivers".tr),
                  Container(height: 30, width: 3, color: CColors.softGrey),
                  CInfoKeyAndValue(
                      value: cubit.statistics.reviewsCount, k: "Reviews".tr),
                ]);
          },
        ),
      ),
    );
  }
}
