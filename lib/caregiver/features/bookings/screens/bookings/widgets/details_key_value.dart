import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CDetailsKeyAndValue extends StatelessWidget {
  const CDetailsKeyAndValue({super.key, required this.k, required this.value});
  final String k;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          k,
          style: CAppStyles.styleRegular14(context)
              .copyWith(color: CColors.darkGrey),
        ),
        Text(
          value,
          style: CAppStyles.styleSemiBold14(context),
        ),
      ],
    );
  }
}
