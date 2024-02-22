
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategorieListViewItem extends StatelessWidget {
  const CategorieListViewItem({
    super.key,
    required this.image,
    required this.text, this.onTap,
  });
  final String image, text;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap ,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffEBF1F0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(image),
             const SizedBox(height: 8,),
              Text(
                text,
                style: AppStyles.styleSemiBold10(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
