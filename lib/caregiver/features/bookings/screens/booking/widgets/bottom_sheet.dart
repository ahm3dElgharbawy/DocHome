import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/details_key_value.dart';
import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/paid_status_card.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CBookingDetailsBottomSheet extends StatelessWidget {
  const CBookingDetailsBottomSheet(
      {super.key,
      required this.patientName,
      required this.location,
      required this.date});
  final String patientName;
  final String location;
  final String date;
  @override
  Widget build(BuildContext context) {
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
              "Booking Details",
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
                  CDetailsKeyAndValue(k: "Patient Name", value: patientName),
                  const CDetailsKeyAndValue(
                      k: "Phone Number", value: "01028365306"),
                  CDetailsKeyAndValue(k: "Location", value: location),
                  CDetailsKeyAndValue(k: "Date", value: date)
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
            Row(
              children: [
                Expanded(
                  child: CRoundedButton(
                    onPressed: () {},
                    title: "Cancel",
                    color: Colors.red,
                  ),
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Expanded(
                  child: CRoundedButton(
                    onPressed: () {},
                    title: "Accept",
                    color: CColors.success,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
