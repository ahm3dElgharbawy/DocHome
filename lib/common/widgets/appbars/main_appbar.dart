import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CMainAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CMainAppBar(
      {super.key,
      this.title,
      this.showBackArrow = true,
      this.centerTitle,
      this.leading,
      this.actions});
  final String? title;
  final bool showBackArrow;
  final bool? centerTitle;
  final Widget? leading;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: showBackArrow,
      title: title != null
          ? Text(
              title!,
              style: CAppStyles.styleBold25(context),
            )
          : null,
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
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(CSizes.appBarHeight);
}
