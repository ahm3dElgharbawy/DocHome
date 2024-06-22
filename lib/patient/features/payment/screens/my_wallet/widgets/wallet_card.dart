import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CWalletCard extends StatelessWidget {
  const CWalletCard(
      {super.key, this.width, this.empty = true, this.balance, this.margin});
  final double? width;
  final bool empty;
  final String? balance;
  final EdgeInsetsGeometry? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 190,
      width: width,
      margin: margin,
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              offset: const Offset(0, -2),
              blurRadius: 10,
            )
          ]),
      child: empty
          ? null
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                  Row(
                    children: [
                      const CCircularContainer(
                        color: CColors.primary,
                        height: 50,
                        width: 50,
                        child: Icon(
                          Icons.wallet,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: CSizes.spaceBtwItems),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "My Wallet".tr,
                            style: CAppStyles.styleMedium16(context),
                          ),
                          Text(
                            "Default Payment Method".tr,
                            style: CAppStyles.styleMedium15(context)
                                .copyWith(color: CColors.darkGrey),
                          )
                        ],
                      )
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BALANCE".tr,
                        style: CAppStyles.styleMedium13(context)
                            .copyWith(color: CColors.darkGrey),
                      ),
                      Text(balance ?? "",
                          style: CAppStyles.styleRegular30(context)
                              .copyWith(color: CColors.primary))
                    ],
                  )
                ]),
    );
  }
}
