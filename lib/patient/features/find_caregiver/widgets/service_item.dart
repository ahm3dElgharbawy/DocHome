import 'package:dochome/patient/features/find_caregiver/models/service_model.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({
    super.key, required this.serviceModel,
  });
final ServiceModel serviceModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(26),
        color: Colors.white,
        border: Border.all(
          color: const Color(0xff756969),
          width: 0.5,
        ),
      ),
      child: Center(
          child: Text(
        serviceModel.serviceName,
        style: CAppStyles.styleBold16(context),
      )),
    );
  }
}