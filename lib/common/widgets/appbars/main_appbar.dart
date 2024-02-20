import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CMainAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.centerTitle,
      this.leading});
  final String? title;
  final bool showBackArrow;
  final bool? centerTitle;
  final Widget? leading;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackArrow,
      title: title != null ? Text(title!) : null,
      centerTitle: centerTitle,
      backgroundColor: Colors.transparent,
      foregroundColor: Colors.black,
      elevation: 0,
      leading: showBackArrow
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios))
          : leading,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(CSizes.appBarHeight);
}
