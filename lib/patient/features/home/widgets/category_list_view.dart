import 'package:dochome/patient/features/find_caregiver/screens/analysis_labs/analysis_lab_category.dart';
import 'package:dochome/patient/features/find_caregiver/screens/nursing/nursing_category.dart';
import 'package:dochome/patient/features/find_caregiver/screens/physical_therapy/pysical_therapy_category.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import './category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          CategoryListViewItem(
            image: CImages.nursingCategory,
            text: 'Nursing',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const NursingCategory();
              }));
            },
          ),
          const SizedBox(
            width: 30,
          ),
          CategoryListViewItem(
            image: CImages.physicaltherapyCategory,
            text: 'Pysical Therapy',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const PhysicalTherapyCategory();
              }));
            },
          ),
          const SizedBox(
            width: 30,
          ),
          CategoryListViewItem(
            image: CImages.analysisabsCategory,
            text: 'Analysis labs',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return const AnalysisLabCategory();
              }));
            },
          ),
        ],
      ),
    );
  }
}
