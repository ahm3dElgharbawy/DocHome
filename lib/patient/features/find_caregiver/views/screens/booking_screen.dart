import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/booking_doctor_details.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CColors.primary,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  CImages.doc3,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned(
              top: 60,
              left: 10,
              child: CRoundedContainer(
                height: 40,
                width: 40,
                radius: 12,
                color: Colors.white24,
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back_ios_new_outlined),
              )),
          const Positioned.fill(
            top: 300,
            child: BookingDoctorDetails(),
          ),
        ],
      ),
    );
  }
}
