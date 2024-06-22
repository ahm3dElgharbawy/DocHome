import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/booking_doctor_details.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final caregiver = CaregiversCubit.get(context).selectedCaregiver;
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
                height: 320,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(
                      caregiver.profileImage.asLink(),
                    ),
                    fit: BoxFit.cover,
                  ),
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
          Positioned.fill(
            top: 300,
            child: BookingDoctorDetails(
              caregiver: caregiver,
            ),
          ),
        ],
      ),
    );
  }
}
