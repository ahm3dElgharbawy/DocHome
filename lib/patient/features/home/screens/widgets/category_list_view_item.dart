import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.image,
    this.onTap,
    this.text,
  });
  final String image;
  final Function()? onTap;
  final String ? text;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1.3/1,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: const Color(0xffEBF1F0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CachedNetworkImage(imageUrl: image.asLink(),height: 50,),
              const SizedBox(
                height: 8,
              ),
              Text(
                text!,
                style: CAppStyles.styleSemiBold10(context),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
