import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CLoadingWidget extends StatelessWidget {
  const CLoadingWidget({super.key, this.indicatorColor = CColors.primary, this.padding});
  final Color indicatorColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: indicatorColor,
      ),
    );
  }
}
