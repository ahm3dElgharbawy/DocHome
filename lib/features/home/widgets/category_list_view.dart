import 'package:dochome/features/home/widgets/category_list_view_item.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CategorieListView extends StatelessWidget {
  const CategorieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: const [
           CategorieListViewItem(
            image: CImages.nursingCategory,
            text: 'Nursing',
          ),
          SizedBox(width: 30,),
          CategorieListViewItem(
            image: CImages.physicaltherapyCategory,
            text: 'Physiotherapist',
          ),
          SizedBox(width: 30,),
          CategorieListViewItem(
            image: CImages.analysisabsCategory,
            text: 'Analysis labs',
          ),
        ],
      ),
    );

  }
}
