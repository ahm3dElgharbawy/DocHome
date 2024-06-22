import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CCircularContainer extends StatelessWidget {
  const CCircularContainer({
    super.key,
    this.height = 40,
    this.width = 40,
    this.onTap,
    this.child,
    this.margin,
    this.padding,
    this.color = CColors.white,
    this.radius = 36,
    this.enableBorder = false,
    this.borderColor = CColors.grey,
    this.backgroundImage,
  });
  final double? height;
  final double? width;
  final VoidCallback? onTap;
  final Widget? child;
  final EdgeInsetsGeometry? margin;
  final EdgeInsetsGeometry? padding;
  final Color color;
  final double radius;
  final bool enableBorder;
  final Color borderColor;
  final ImageProvider? backgroundImage;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
            image: backgroundImage != null
                ? DecorationImage(image: backgroundImage!,fit: BoxFit.cover)
                : null,
            border: enableBorder
                ? Border.all(
                    color: borderColor,
                    width: 1,
                  )
                : null),
        child: Center(child: child),
      ),
    );
  }
}
