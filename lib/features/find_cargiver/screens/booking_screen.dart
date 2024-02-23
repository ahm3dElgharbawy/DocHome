import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/features/find_cargiver/widgets/about_section.dart';
import 'package:dochome/features/find_cargiver/widgets/booking_doctor_details.dart';
import 'package:dochome/features/find_cargiver/widgets/custom_app_bar.dart';
import 'package:dochome/features/find_cargiver/widgets/custom_elevated_botton.dart';
import 'package:dochome/features/find_cargiver/widgets/status_section.dart';
import 'package:dochome/features/home/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 221, 214, 192),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  'assets/images/Rectangle 45.png',
                  fit: BoxFit.cover,
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
