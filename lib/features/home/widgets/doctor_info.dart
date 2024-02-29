import 'package:dochome/features/find_cargiver/screens/booking_screen.dart';
import 'package:dochome/features/home/models/Doctor_detalis_model.dart';
import 'package:dochome/features/home/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorInfoItem extends StatelessWidget {
  const DoctorInfoItem({
    super.key,
    required this.doctorDetalisModel,
  });
  final DoctorDetalisModel doctorDetalisModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return BookingScreen();
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
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(12),
                    ),
                child: Image.asset(
                  doctorDetalisModel.image,
                  fit: BoxFit.fill,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    doctorDetalisModel.name,
                    style: AppStyles.styleRegular15(context)
                        .copyWith(fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    doctorDetalisModel.titel,
                    style: AppStyles.styleRegular12(context)
                        .copyWith(fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomRateRow(),
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
                  Container(
                    height: 16,
                    width: 36,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: const Color.fromARGB(255, 201, 252, 223)),
                    child: Center(
                        child: Text(
                      'Active',
                      style: AppStyles.styleRegular10(context)
                          .copyWith(color: const Color(0xff20C968)),
                    )),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
