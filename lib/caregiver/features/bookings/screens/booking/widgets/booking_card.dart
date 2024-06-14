import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/bottom_sheet.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CCareGiverBookingsCard extends StatelessWidget {
  const CCareGiverBookingsCard(
      {super.key,
      required this.patientName,
      required this.location,
      required this.date});
  final String patientName;
  final String location;
  final String date;

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
        decoration:  BoxDecoration(
          color: CColors.white,
          borderRadius: BorderRadius.circular(10),
          border: const Border(left: BorderSide(color: CColors.primary,width: 4),right: BorderSide(color: CColors.primary,width: 4)),
          boxShadow: const [
            BoxShadow(
              color: CColors.grey,
              blurRadius: 10,
              spreadRadius: 1
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Appointment Date",
              style: CAppStyles.styleMedium12(context)
                  .copyWith(color: Colors.grey),
            ),
            const SizedBox(height: CSizes.spaceBtwItems / 2),
            Row(
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 18,
                ),
                const SizedBox(width: CSizes.spaceBtwItems / 2),
                Text("Wed Jun 24 , 4:30 AM",
                    style: CAppStyles.styleRegular12(context)),
              ],
            ),
            const Divider(
              height: 20,
              color: Colors.grey,
            ),
            Row(
              children: [
                const CircleAvatar(
                    // backgroundImage: CachedNetworkImageProvider(""),
                    backgroundImage: AssetImage(CImages.user)),
                const SizedBox(width: CSizes.spaceBtwItems / 2),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Mahmoud ali",
                      style: CAppStyles.styleMedium14(context),
                    ),
                    Text(
                      "Kafr eldwar",
                      style: CAppStyles.styleMedium12(context)
                          .copyWith(color: Colors.grey),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  viewBookingDetails(context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(CSizes.cardRadiusLg),
          topRight: Radius.circular(CSizes.cardRadiusLg),
        ),
      ),
      builder: (context) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.6,
        child: CBookingDetailsBottomSheet(
          patientName: patientName,
          location: location,
          date: date,
        ),
      ),
    );
  }
}
