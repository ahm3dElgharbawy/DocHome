import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class CTextFieldWithInnerShadow extends StatefulWidget {
  const CTextFieldWithInnerShadow({
    super.key,
    this.margin,
    this.controller,
    this.prefixIcon,
    this.suffixIcon,
    this.onTapSuffixIcon,
    required this.hintText,
    this.validator,
    this.obscureText = false, this.keyboardType,
  });
  final String hintText;
  final EdgeInsets? margin;
  final TextEditingController? controller;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final VoidCallback? onTapSuffixIcon;
  final String? Function(String?)? validator;
  final bool obscureText;
  final TextInputType? keyboardType;

  @override
  State<CTextFieldWithInnerShadow> createState() => _CTextFieldWithInnerShadowState();
}

class _CTextFieldWithInnerShadowState extends State<CTextFieldWithInnerShadow> {
  late bool isHidden;
  @override
  void initState() {
    isHidden = widget.obscureText;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: widget.margin ?? const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
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
          controller: widget.controller,
          validator: widget.validator,
          obscureText: isHidden,
          keyboardType: widget.keyboardType,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: CAppStyles.styleMedium13(context).copyWith(color: const Color(0xff757575)),
            prefixIcon: widget.prefixIcon,
            suffixIcon: widget.suffixIcon != null
                ? GestureDetector(
                    onTap: widget.onTapSuffixIcon,
                    child: widget.suffixIcon!,
                  )
                :toggleVisibility(),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            border: InputBorder.none,
          ),
        ),
      ]),
    );
  }
  Widget? toggleVisibility() {
    if (widget.obscureText) {
      return GestureDetector(
        onTap: () {
          setState(() {
            isHidden = !isHidden;
          });
        },
        child: Icon(isHidden ? Icons.visibility_off : Icons.visibility),
      );
    }
    return null;
  }
}
