import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CPaidStatusCard extends StatelessWidget {
  const CPaidStatusCard({super.key, required this.isPaid});
  final bool isPaid;

  @override
  Widget build(BuildContext context) {
    return CRoundedContainer(
      width: double.infinity,
      color: CColors.white,
      enableBorder: true,
      borderColor: CColors.grey,
      radius: CSizes.cardRadiusMd,
      padding: const EdgeInsets.all(CSizes.md),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Paid Status",
            style: CAppStyles.styleRegular14(context)
                .copyWith(color: CColors.darkGrey),
          ),
          CRoundedContainer(
            color: isPaid
                ? CColors.success.withOpacity(.14)
                : Colors.red.withOpacity(.14),
            radius: 6,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Text(
              isPaid ? 'Paid' : "Un Paid",
              style: CAppStyles.styleSemiBold14(context).copyWith(
                color: isPaid ? CColors.success : Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
