
import 'package:dochome/features/home/models/Doctor_detalis_model.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomRateRow extends StatelessWidget {
  const CustomRateRow({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset('assets/images/stars.svg'),
        const SizedBox(
          width: 8,
        ),
        Text(
          '${4.5} | ${144} Reviews',
          style: AppStyles.styleRegular10(context)
              .copyWith(fontFamily: 'Outfit'),
        ),
      ],
    );
  }
}
