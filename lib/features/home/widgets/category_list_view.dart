import 'package:dochome/features/find_cargiver/screens/analysis_labs/analysis_lab_category.dart';
import 'package:dochome/features/find_cargiver/screens/nursing/nursing_category.dart';
import 'package:dochome/features/find_cargiver/screens/physical_therapy/pysical_therapy_category.dart';
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
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return NursingCategory();
              }));
            },
          ),
          const SizedBox(
            width: 30,
          ),
           CategorieListViewItem(
            image: CImages.physicaltherapyCategory,
            text: 'Pysical Therapy',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return PysicalTherapyCategory();
              }));
            },
          ),
          const SizedBox(
            width: 30,
          ),
          CategorieListViewItem(
            image: CImages.analysisabsCategory,
            text: 'Analysis labs',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AnalysisLabCategory();
              }));
            },
          ),
        ],
      ),
    );
  }
}
