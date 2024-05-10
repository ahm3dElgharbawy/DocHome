import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key,
    required this.service, required this.isSlected,
  });
  final ServiceModel service;
 final bool isSlected ;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: isSlected! ? CColors.primary : Colors.white,
        // color: Colors.white,
        border: Border.all(
          color: const Color(0xff756969),
          width: 0.5,
        ),
      ),
      child: Center(
          child: Text(
        service.nameEn!,
        style: CAppStyles.styleBold16(context).copyWith(
          color: isSlected! ? Colors.white : Colors.black,
        ),
      )),
    );
  }
}
