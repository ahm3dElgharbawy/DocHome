import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/patient/features/find_caregiver/widgets/about_section.dart';
import 'package:dochome/patient/features/find_caregiver/widgets/custom_elevated_botton.dart';
import 'package:dochome/patient/features/find_caregiver/widgets/status_section.dart';
import 'package:dochome/patient/features/home/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class BookingDoctorDetails extends StatelessWidget {
  const BookingDoctorDetails({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(24),
          topEnd: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Dr. Ahmed Adel ',
                        style: CAppStyles.styleRegular23(context),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Doctor of physical therapy',
                        style: CAppStyles.styleLight12(context),
                      ),
                    ),
                  ],
                ),
                const CustomElevatedButton(
                  icon: Icons.phone_enabled_outlined,
                  color: CColors.primary,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRateRow(),
                CustomElevatedButton(
                  icon: Icons.email,
                  color: Colors.amber,
                ),
              ],
            ),
            const Divider(),
            const AboutSection(),
            const SizedBox(
              height: 20,
            ),
            const StatusSection(),
           const Expanded(
              child:  SizedBox(
                height: 20,
              ),
            ),
            CRoundedButton(
              title: 'Make an appointmentle',
              onPressed: () {},
            ),
          const  SizedBox(
                height: 20,
              ),
          ],
        ),
      ),
    );
  }
}
