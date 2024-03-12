import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CInfoKeyAndValue extends StatelessWidget {
  const CInfoKeyAndValue({super.key, required this.value, required this.k});
  final int value;
  final String k;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.toString(),
          style: CAppStyles.styleRegular14(context)
              .copyWith(fontWeight: FontWeight.bold),
        ),
        Text(
          k,
          style:
              CAppStyles.styleRegular12(context).copyWith(color: Colors.grey),
        ),
      ],
    );
  }
}
