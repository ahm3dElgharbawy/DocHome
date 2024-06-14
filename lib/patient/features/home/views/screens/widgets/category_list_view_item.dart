import 'package:dochome/patient/features/home/data/models/categorie_model.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CategoryListViewItem extends StatelessWidget {
  const CategoryListViewItem({
    super.key,
    required this.image,
    this.onTap,
    required this.categories,
  });
  final String image;
  final Function()? onTap;
  final CategorieModel categories;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
              // CachedNetworkImage(imageUrl: 'https://dochomd4u.000webhostapp.com"${categories.image}'),
              const SizedBox(
                height: 8,
              ),
              Text(
                categories.nameEn!,
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
