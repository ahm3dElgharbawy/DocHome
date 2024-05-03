import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/bottom_sheet.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
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
    return CRoundedContainer(
      color: CColors.softGrey,
      width: double.infinity,
      height: null,
      radius: 10,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      margin: const EdgeInsets.symmetric(vertical: CSizes.sm),
      onTap: () {
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
      },
      child: Row(children: [
        const CRoundedContainer(
          height: 50,
          width: 50,
          radius: 10,
          color: Colors.transparent,
          backgroundImage: AssetImage(CImages.user),
        ),
        const SizedBox(
          width: CSizes.spaceBtwItems,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patientName,
                style: CAppStyles.styleMedium13(context),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: CSizes.sm),
                child: Text(
                  location,
                  style: CAppStyles.styleRegular13(context)
                      .copyWith(color: CColors.darkGrey),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Text(
                date,
                style: CAppStyles.styleMedium13(context)
                    .copyWith(color: CColors.primary),
              )
            ],
          ),
        )
      ]),
    );
  }
}
