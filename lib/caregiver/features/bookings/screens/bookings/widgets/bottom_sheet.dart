import 'package:dochome/caregiver/features/bookings/data/models/bookings.dart';
import 'package:dochome/caregiver/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/caregiver/features/bookings/screens/bookings/widgets/details_key_value.dart';
import 'package:dochome/caregiver/features/bookings/screens/bookings/widgets/paid_status_card.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class CBookingDetailsBottomSheet extends StatelessWidget {
  const CBookingDetailsBottomSheet({
    super.key,
    required this.booking,
  });
  final CaregiverBookingsModel booking;

  @override
  Widget build(BuildContext context) {
    final cubit = CaregiverBookingsCubit.get(context);
    return Container(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //? custom drug handler
            Center(
              child: CCircularContainer(
                height: 5,
                color: Colors.grey[400]!,
                width: 200,
              ),
            ),
            const SizedBox(height: CSizes.spaceBtwSections),
            Text(
              "Booking Details".tr,
              style: CAppStyles.styleSemiBold21(context),
            ),
            const SizedBox(height: CSizes.spaceBtwItems),

            //? patient details and date of booking
            CRoundedContainer(
              width: double.infinity,
              color: CColors.white,
              enableBorder: true,
              borderColor: CColors.grey,
              radius: CSizes.cardRadiusMd,
              padding: const EdgeInsets.all(CSizes.md),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CDetailsKeyAndValue(
                      k: "Patient Name".tr, value: booking.userName),
                  CDetailsKeyAndValue(
                      k: "Phone Number".tr, value: "01028365306"),
                  CDetailsKeyAndValue(
                      k: "Center".tr,
                      value: trans(
                          enText: booking.center.nameEn,
                          arText: booking.center.nameAr)),
                  CDetailsKeyAndValue(k: "Appointment Date".tr, value: booking.startDate)
                ],
              ),
            ),
            //? paid status card (paid or !paid)
            const SizedBox(height: CSizes.spaceBtwSections),
            const CPaidStatusCard(
              isPaid: true,
            ),
            const SizedBox(height: CSizes.spaceBtwSections),

            //? accept or cancel booking buttons
            if (booking.status == null)
              Column(
                children: [
                  CRoundedButton(
                      onPressed: () async {
                        // open external google map
                        String googleMapsUrl =
                            "https://www.google.com/maps/search/?api=1&query=${booking.location.latitude},${booking.location.longitude}";
                        await launchUrl(Uri.parse(googleMapsUrl));
                      },
                      title: "View Location on The map".tr),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  BlocConsumer<CaregiverBookingsCubit, CaregiverBookingsState>(
                    listener: (context, state) {
                      if (state is SuccessAcceptBookingState) {
                        "success accept the booking".tr.showAsToast(Colors.green);
                        context.pop();
                      } else if (state is SuccessCancelBookingState) {
                        "success cancel the booking".tr.showAsToast(Colors.green);
                        context.pop();
                      } else if (state is FailureAcceptOrCancelBookingState) {
                        state.message.showAsToast(Colors.red);
                      }
                    },
                    builder: (context, state) {
                      return Row(
                        children: [
                          Expanded(
                            child: CRoundedButton(
                              onPressed: () {
                                cubit.cancelOrAcceptBooking(false, booking.id);
                              },
                              title: "Cancel".tr,
                              color: Colors.red,
                              child: state is LoadingCancelBookingState
                                  ? const CLoadingWidget(
                                      indicatorColor: Colors.white,
                                    )
                                  : null,
                            ),
                          ),
                          const SizedBox(width: CSizes.spaceBtwItems),
                          Expanded(
                            child: CRoundedButton(
                              onPressed: () {
                                cubit.cancelOrAcceptBooking(true, booking.id);
                              },
                              title: "Accept".tr,
                              color: CColors.success,
                              child: state is LoadingAcceptBookingState
                                  ? const CLoadingWidget(
                                      indicatorColor: Colors.white,
                                    )
                                  : null,
                            ),
                          )
                        ],
                      );
                    },
                  ),
                ],
              )
          ],
        ),
      ),
    );
  }
}
