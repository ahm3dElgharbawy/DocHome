import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/about_section.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_elevated_botton.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/status_section.dart';
import 'package:dochome/patient/features/home/views/screens/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class BookingDoctorDetails extends StatelessWidget {
  const BookingDoctorDetails({
    super.key, required this.cargiverModel,
  });
final CargiverModel cargiverModel;
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
                        cargiverModel.name!,
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
                CustomElevatedButton(
                  onTap: () {},
                  icon: Icons.phone_enabled_outlined,
                  color: CColors.primary,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomRateRow(),
                CustomElevatedButton(
                  onTap: () {},
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
              child: SizedBox(
                height: 20,
              ),
            ),
            CRoundedButton(
              title: 'Make an Appointment',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
