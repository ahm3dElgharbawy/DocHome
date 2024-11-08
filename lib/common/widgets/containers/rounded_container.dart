import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class CRoundedContainer extends StatelessWidget {
  const CRoundedContainer({
    super.key,
    this.height,
    this.width,
    this.onTap,
    this.child,
    this.margin,
    this.padding,
    this.color = CColors.primary,
    this.radius = 36,
    this.enableBorder = false,
    this.borderColor = CColors.grey,
    this.backgroundImage,
    this.centerChild = true
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
  final bool centerChild;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height,
        width: width,
        padding: padding,
        margin: margin,
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            color: color,
            image: backgroundImage != null
                ? DecorationImage(image: backgroundImage!, fit: BoxFit.cover)
                : null,
            border: enableBorder
                ? Border.all(
                    color: borderColor,
                    width: 1,
                  )
                : null),
        child: centerChild ? Center(child: child) : child,
      ),
    );
  }
}
