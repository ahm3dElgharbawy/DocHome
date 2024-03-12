import 'package:dochome/patient/features/bookings/screens/booking_screen/widgets/bookings_card.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbars/main_appbar.dart';
import '../../../../../utils/constants/image_strings.dart';

class PatientBookingsScreen extends StatefulWidget {
  const PatientBookingsScreen({super.key});

  @override
  State<PatientBookingsScreen> createState() => _PatientBookingsScreenState();
}

class _PatientBookingsScreenState extends State<PatientBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CMainAppBar(
        showBackArrow: false,
        title: "My Bookings",
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CBookingsCard(
                status: 1,
                date: "12/01/2023",
                caregiverName: "Dr. Hode Elbatrwy",
                caregiverImage: AssetImage(CImages.doc1),
                time: "10:30 AM",
                caregiverSpecialties:
                    "Physical therapy \n - Cupping \n - Treatment sessions",
              ),
              CBookingsCard(
                status: 0,
                date: "12/01/2023",
                caregiverName: "Dr. Assma Abass",
                caregiverImage: AssetImage(CImages.doc2),
                time: "10:30 AM",
                caregiverSpecialties:
                    "Nursing \n - Intravenous Injection \n - Sensitivity Test \n - Installation of a urinary catheter ",
              ),
              CBookingsCard(
                status: 2,
                date: "12/01/2023",
                caregiverName: "Dr. Mohamed Atya",
                caregiverImage: AssetImage(CImages.doc3),
                time: "10:30 AM",
                caregiverSpecialties:
                    "Nursing \n - Enema \n - Lotion Installation \n - Sensitivity Test ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
