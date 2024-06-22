import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class NormalTextField extends StatelessWidget {
  const NormalTextField({
    super.key,
    required this.hintText,
    this.controller,
    this.validator,
    this.expanded = false,
    this.readOnly = false,
    this.onTap,
    this.initialValue,
    this.label,
    this.maxLines,
  });
  final String hintText;
  final TextEditingController? controller;
  final String? initialValue;
  final String? Function(String?)? validator;
  final bool expanded;
  final bool readOnly;
  final String? label;
  final VoidCallback? onTap;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: TextFormField(
        maxLines: maxLines,
        minLines: null,
        readOnly: readOnly,
        initialValue: initialValue,
        expands: expanded,
        controller: controller,
        textAlignVertical: TextAlignVertical.top,
        validator: validator,
        onTap: onTap,
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          label: label != null
              ? Text(
                  label!,
                  style: CAppStyles.styleRegular18(context),
                )
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[200]!),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey),
          ),
          fillColor: CColors.softGrey,
          filled: true,
          hintText: hintText,
          hintStyle: CAppStyles.styleRegular14(context),
        ),
      ),
    );
  }
}
