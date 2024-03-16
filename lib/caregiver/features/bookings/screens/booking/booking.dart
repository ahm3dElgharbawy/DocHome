import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/booking_card.dart';
import 'package:dochome/common/widgets/appbars/home_appbar.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CaregiverBookingsScreen extends StatelessWidget {
  const CaregiverBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CHomeAppBar(
                padding: EdgeInsets.only(
                  top: 50,
                ),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              Text(
                "Bookings",
                style: CAppStyles.styleMedium24(context)
                    .copyWith(color: Colors.black),
              ),
              const SizedBox(height: CSizes.spaceBtwSections),
              const CCareGiverBookingsCard(patientName: "Ahmed ali",location: "kafr eldwar",date: "25-3-2024",),
              const CCareGiverBookingsCard(patientName: "Mahmoud ahmed",location: "kafr eldwar",date: "22-5-2024",),
              const CCareGiverBookingsCard(patientName: "Ahmed hesham",location: "kafr eldwar",date: "3-4-2024",),
            ],
          ),
        ),
      ),
    );
  }
}
