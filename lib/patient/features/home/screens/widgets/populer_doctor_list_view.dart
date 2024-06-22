import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/shimmers/popular_caregiver_shimmer.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/booking_screen.dart';
import 'package:dochome/patient/features/home/logic/popular_cargivers_cubit/popular_caregivers_cubit.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'doctor_info.dart';

class PopularDoctorsListView extends StatefulWidget {
  const PopularDoctorsListView({super.key});

  @override
  State<PopularDoctorsListView> createState() => _PopularDoctorsListViewState();
}

class _PopularDoctorsListViewState extends State<PopularDoctorsListView> {
  late PopularCaregiversCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit = PopularCaregiversCubit.get(context)..getAllPopularCaregivers();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PopularCaregiversCubit, PopularCaregiversState>(
      builder: (context, state) {
        // return const CustomPopularCaregiversLoadingShimmer();

        if (state is PopularCaregiversSuccess) {
          return state.popularCaregivers.isNotEmpty
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Caregivers'.tr,
                      style: CAppStyles.styleMedium24(context),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ...state.popularCaregivers.map(
                      (c) => DoctorInfoItem(
                        caregiver: c,
                        onTap: () {
                          CaregiversCubit.get(context).selectedCaregiver = c;
                          context.push(const BookingScreen());
                        },
                      ),
                    )
                  ],
                )
              : const SizedBox();
        } else if (state is PopularCaregiversFailure) {
          return CustomFailureWidget(onTap: () {
            cubit.getAllPopularCaregivers();
          });
        } else {
          return const CustomPopularCaregiversLoadingShimmer();
        }
      },
    );
  }
}
