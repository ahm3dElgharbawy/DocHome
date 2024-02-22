import 'package:dochome/features/home/widgets/category_list_view_item.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategorieListView extends StatelessWidget {
  const CategorieListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategorieListViewItem(
            image: CImages.nursingCategory,
            text: 'Nursing',
            onTap: () {
              Get.toNamed('/NursingCategory');
            },
          ),
          const SizedBox(
            width: 30,
          ),
          const CategorieListViewItem(
            image: CImages.physicaltherapyCategory,
            text: 'Physiotherapist',
          ),
          const SizedBox(
            width: 30,
          ),
          const CategorieListViewItem(
            image: CImages.analysisabsCategory,
            text: 'Analysis labs',
          ),
        ],
      ),
    );
  }
}
