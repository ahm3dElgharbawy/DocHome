import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CSettingsList extends StatelessWidget {
  const CSettingsList({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 300,
      left: 0,
      right: 0,
      child: CRoundedContainer(
        height: null,
        margin: const EdgeInsets.symmetric(
            horizontal: CSizes.defaultSpace, vertical: CSizes.md),
        // padding: const EdgeInsets.symmetric(vertical: CSizes.md),
        radius: 20,
        color: Colors.white,
        child: child
      ),
    );
  }
}
