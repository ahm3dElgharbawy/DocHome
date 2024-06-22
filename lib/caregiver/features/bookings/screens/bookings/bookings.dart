import 'package:dochome/caregiver/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/caregiver/features/bookings/screens/bookings/widgets/booking_card.dart';
import 'package:dochome/common/widgets/appbars/home_appbar.dart';
import 'package:dochome/common/widgets/empty_widget.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/shimmers/caregiver_bookings_shimmer.dart';
import 'package:dochome/components/notifications/screens/all_notifications/notifications_screen.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/caregiver_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CaregiverBookingsScreen extends StatelessWidget {
  const CaregiverBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = CaregiverBookingsCubit.get(context)..getBookings();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            CHomeAppBar(
              avatar: CaregiverLocal.get()!.profileImage,
              padding: const EdgeInsets.only(
                  left: CSizes.defaultSpace,
                  right: CSizes.defaultSpace,
                  top: 15),
              onTapActions: () {
                context.push(
                  const NotificationsScreen(userType: UserType.caregiver),
                );
              },
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
            Expanded(
              child:
                  BlocBuilder<CaregiverBookingsCubit, CaregiverBookingsState>(
                builder: (context, state) {
                  if (state is FailureCaregiverBookingsState) {
                    return CustomFailureWidget(onTap: () {
                      cubit.getBookings();
                    });
                  } else if (state is LoadingCaregiverBookingsState) {
                    return const CustomCaregiverBookingsShimmer();
                  }
                  return cubit.bookings.isEmpty
                      ? const CustomEmptyWidget()
                      : ListView.builder(
                          padding: const EdgeInsets.only(
                            left: CSizes.defaultSpace,
                            right: CSizes.defaultSpace,
                          ),
                          itemCount: cubit.bookings.length,
                          itemBuilder: (context, index) =>
                              CCareGiverBookingsCard(
                            booking: cubit.bookings[index],
                          ),
                        );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
