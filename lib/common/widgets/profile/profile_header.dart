import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CProfileHeader extends StatelessWidget {
  const CProfileHeader(
      {super.key,
      required this.userName,
      required this.userEmail,
      this.color = CColors.primary, required this.image});
  final String userName;
  final String userEmail;
  final Color color;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CCircularContainer(
            height: 60,
            width: 60,
            padding: const EdgeInsets.all(2),
            color: Colors.white,
            child: image,
          ),
          const SizedBox(
            height: CSizes.spaceBtwItems,
          ),
          Text(
            userName,
            style: CAppStyles.styleRegular18(context)
                .copyWith(color: Colors.white,fontWeight: FontWeight.bold),
          ),
          Text(
            userEmail,
            style: CAppStyles.styleRegular14(context)
                .copyWith(color: Colors.white),
          ),
        ],
      ),
    );
  }
}
