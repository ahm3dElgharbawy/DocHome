import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CSettingsTile extends StatelessWidget {
  const CSettingsTile({super.key, required this.title, required this.leadingIcon, required this.leadingBackgroundColor, this.onTap});
  final String title;
  final IconData leadingIcon;
  final Color leadingBackgroundColor;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.md),
        child: Row(
          children: [
            CCircularContainer(
              color: leadingBackgroundColor,
              radius: 13,
              child: Icon(leadingIcon, color: Colors.white),
            ),
            const SizedBox(width: CSizes.spaceBtwItems),
            Text(title),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios_rounded, size: CSizes.iconSm)
          ],
        ),
      ),
    );
  }
}
