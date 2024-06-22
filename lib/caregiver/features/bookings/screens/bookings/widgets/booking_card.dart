import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/caregiver/features/bookings/data/models/bookings.dart';
import 'package:dochome/caregiver/features/bookings/screens/bookings/widgets/add_report.dart';
import 'package:dochome/caregiver/features/bookings/screens/bookings/widgets/bottom_sheet.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CCareGiverBookingsCard extends StatelessWidget {
  const CCareGiverBookingsCard({
    super.key,
    required this.booking,
  });
  final CaregiverBookingsModel booking;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        viewBookingDetails(context);
      },
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        margin: const EdgeInsets.symmetric(vertical: CSizes.sm),
        decoration: BoxDecoration(
            color: CColors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border(
              left: BorderSide(
                  color: booking.status == null
                      ? CColors.primary
                      : booking.status == 1
                          ? Colors.green
                          : Colors.red,
                  width: 4),
              right: BorderSide(
                  color: booking.status == null
                      ? CColors.primary
                      : booking.status == 1
                          ? Colors.green
                          : Colors.red,
                  width: 4),
            ),
            boxShadow: const [
              BoxShadow(color: CColors.grey, blurRadius: 10, spreadRadius: 1)
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appointment Date".tr,
              style: CAppStyles.styleMedium12(context)
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(height: CSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(
                  Icons.date_range,
                  size: 18,
                ),
                const SizedBox(width: CSizes.spaceBtwItems / 2),
                Text(booking.startDate,
                    style: CAppStyles.styleRegular12(context)),
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
            Row(
              children: [
                CircleAvatar(
                  // backgroundImage: CachedNetworkImageProvider(""),
                  backgroundImage: CachedNetworkImageProvider(
                      booking.userProfileImage.asLink()),
                ),
                const SizedBox(width: CSizes.spaceBtwItems / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      booking.userName,
                      style: CAppStyles.styleMedium14(context),
                    ),
                    Text(
                      trans(
                          enText: booking.center.nameEn,
                          arText: booking.center.nameAr),
                      style: CAppStyles.styleMedium12(context)
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                )
              ],
            ),
            if (booking.status == 1 && booking.finished != 1)
              AddingReportWidget(
                booking: booking,
              )
          ],
        ),
      ),
    );
  }

  viewBookingDetails(context) {
    showModalBottomSheet(
      context: context,
      isDismissible: false,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      builder: (context) => SizedBox(
        // height: MediaQuery.of(context).size.height * 0.7,
        child: CBookingDetailsBottomSheet(
          booking: booking,
        ),
      ),
    );
  }
}
