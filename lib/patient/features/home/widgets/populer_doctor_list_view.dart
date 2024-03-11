import 'package:flutter/material.dart';
import '../models/doctor_details_model.dart';
import 'doctor_info.dart';
class PopularDoctorsListView extends StatelessWidget {
  const PopularDoctorsListView({super.key});
  static List populerDoctors = const [
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
    DoctorDetailsModel(
        image: 'assets/images/Rectangle 45.png',
        name: 'Dr. Asmaa Adel ',
        title: 'Doctor of physical therapy',
        rate: 4.5,
        reviews: 177),
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: populerDoctors.map((e) => DoctorInfoItem(doctorDetailsModel: e)).toList(),
    );
  }
}
