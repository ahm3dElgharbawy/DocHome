import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class CDropdown extends StatefulWidget {
  const CDropdown(
      {super.key,
      required this.items,
      required this.hint,
      this.validator,
      this.onChanged});
  final List items;
  final String hint;
  final String? Function(String?)? validator;
  final void Function(String?)? onChanged;

  @override
  State<CDropdown> createState() => _CDropdownState();
}

class _CDropdownState extends State<CDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        // Add more decoration..
      ),
      hint: Text(
        widget.hint,
        style:
            CAppStyles.styleMedium13(context).copyWith(color: CColors.darkGrey),
      ),
      items: widget.items
          .map(
            (item) => DropdownMenuItem<String>(
              value: item.id.toString(),
              child: Text(
                trans(enText: item.nameEn, arText:item.nameAr),
                style: CAppStyles.styleMedium14(context),
              ),
            ),
          )
          .toList(),
      validator: widget.validator,
      onChanged: widget.onChanged,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }
}
