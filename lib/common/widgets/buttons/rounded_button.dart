import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CRoundedButton extends StatelessWidget {
  const CRoundedButton({super.key, required this.title, required this.onPressed, this.margin, this.width = double.infinity, this.height = 50});
  final String title;
  final VoidCallback onPressed;
  final EdgeInsets? margin;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: CColors.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25)
          )
        ),
        child: Text(title , style: AppStyles.styleBold16(context),),
      ),
    );
  }
}
