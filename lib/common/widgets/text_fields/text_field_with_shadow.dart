import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CTextFieldWithInnerShadow extends StatelessWidget {
  const CTextFieldWithInnerShadow({
    super.key,
    this.margin,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    required this.hintText,
    this.validator,
    this.obscureText = false,
  });
  final String hintText;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
      child: Stack(children: [
        //? adding shadow from inside
        Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: CColors.softGrey,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(.3),
                  blurRadius: 6,
                  offset: const Offset(2, 2),
                  inset: true,
                ),
              ]),
        ),
        //? our text field
        TextFormField(
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(color: Color(0xff757575), fontSize: 13),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon != null
                ? GestureDetector(
                    onTap: onTapSuffixIcon,
                    child: suffixIcon!,
                  )
                : null,
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: InputBorder.none,
          ),
        ),
      ]),
    );
  }
}
