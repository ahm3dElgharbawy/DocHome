import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem({
    super.key,
    required this.service,
  });
  final ServiceModel service;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool? isSlected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          // isSlected = true;
          isSlected = isSlected == true ? false : true;
        });
      },
      child: Container(
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
          widget.service.nameEn!,
          style: CAppStyles.styleBold16(context).copyWith(
            color: isSlected! ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
  }
}
