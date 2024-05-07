import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CRoundedButton extends StatelessWidget {
  const CRoundedButton(
      {super.key,
      required this.onPressed,
      required this.title,
      this.margin,
      this.width = double.infinity,
      this.height = 50,
      this.color = CColors.primary,
      this.child});
  final VoidCallback onPressed;
  final String title;
  final EdgeInsets? margin;
  final double width;
  final double height;
  final Color color;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        ),
        child: child ??
            Text(
              title,
              style: CAppStyles.styleBold16(context),
            ),
      ),
    );
  }
}
