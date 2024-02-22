import 'package:dochome/features/home/models/Doctor_detalis_model.dart';
import 'package:dochome/features/home/widgets/populer_doctor_list_view_item.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PopularDoctorsListView extends StatelessWidget {
  const PopularDoctorsListView({super.key});
  static List populerDoctors = const [
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetalisModel(
        image: 'assets/images/img_rectangle_46.png',
        name: 'Dr. Asmaa Adel ',
        titel: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
 
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: populerDoctors.map((e) => PopularDoctorsListViewItem(doctorDetalisModel: e)).toList(),
    );
  }
}
