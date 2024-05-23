import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/booking_screen.dart';
import 'package:dochome/patient/features/home/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorInfoItem extends StatelessWidget {
  const DoctorInfoItem({
    super.key,
    required this.cargiverModel,
  });
  final CargiverModel cargiverModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return const BookingScreen();
        }));
      },
      child: Card(
        elevation: 0,
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Image.asset(
                  cargiverModel.image!,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    cargiverModel.name!,
                    style: CAppStyles.styleRegular15(context)
                        .copyWith(fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  // Text(
                  //   cargiverModel.,
                  //   style: CAppStyles.styleRegular12(context)
                  //       .copyWith(fontFamily: 'Outfit'),
                  // ),
                  const SizedBox(
                    height: 8,
                  ),
                  const CustomRateRow(),
                ],
              ),
              Column(
                children: [
                  const Icon(
                    Icons.bookmark,
                    color: CColors.primary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CRoundedContainer(
                    color: const Color(0xff20C968).withOpacity(.14),
                    height: 18,
                    width: 40,
                    radius: 6,
                    child: Text(
                      'Active',
                      style: CAppStyles.styleRegular10(context).copyWith(
                        color: const Color(0xff20C968),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
