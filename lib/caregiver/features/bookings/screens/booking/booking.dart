import 'package:dochome/caregiver/features/bookings/screens/booking/widgets/booking_card.dart';
import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CaregiverBookingsScreen extends StatelessWidget {
  const CaregiverBookingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: CMainAppBar(
        title: "Bookings",
        showBackArrow: false,
        actions: [
          IconButton(onPressed: (){},icon: const Icon(Icons.notifications))
        ],
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CCareGiverBookingsCard(
                patientName: "Ahmed ali",
                location: "kafr eldwar",
                date: "25-3-2024",
              ),
              CCareGiverBookingsCard(
                patientName: "Mahmoud ahmed",
                location: "kafr eldwar",
                date: "22-5-2024",
              ),
              CCareGiverBookingsCard(
                patientName: "Ahmed hesham",
                location: "kafr eldwar",
                date: "3-4-2024",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
