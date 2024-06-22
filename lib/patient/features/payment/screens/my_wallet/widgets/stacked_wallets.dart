import 'package:dochome/patient/features/payment/screens/my_wallet/widgets/wallet_card.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class CStackedWallets extends StatelessWidget {
  const CStackedWallets({super.key, required this.balance});
  final double balance;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 235,
      child: Stack(
        fit: StackFit.expand,
        children: [
          const Positioned(
            bottom: 30,
            right: 0,
            left: 0,
            child: Center(
              child: CWalletCard(
                margin: EdgeInsets.symmetric(horizontal: 30),
              ),
            ),
          ),
          const Positioned(
            // alignment: Alignment.bottomCenter,
            bottom: 15,
            right: 0,
            left: 0,
            child: Center(
              child: CWalletCard(
                margin: EdgeInsets.symmetric(horizontal: 15),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: CWalletCard(balance: "$balance ${'EGP'.tr}", empty: false),
          ),
        ],
      ),
    );
  }
}
