import 'package:dochome/patient/features/find_caregiver/widgets/booking_doctor_details.dart';
import 'package:dochome/utils/constants/colors.dart';
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
              top: 60,
              left: 10,
              child: GestureDetector(
                onTap: () {
                      Navigator.pop(context);
                    },
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color:Colors.white24,
                    ),
                  child: const Icon(Icons.arrow_back_ios_new_outlined),
                ),
              ),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Center(
                child: Container(
                  height: 300,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: Image.asset(
                      'assets/images/img_app_pho_1_349x416.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const Positioned.fill(
              top: 300,
              child: BookingDoctorDetails(),
            ),
          ],
        ));
  }
}
