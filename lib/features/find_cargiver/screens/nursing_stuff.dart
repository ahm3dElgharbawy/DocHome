import 'package:dochome/features/find_cargiver/widgets/custom_app_bar.dart';
import 'package:dochome/features/home/models/Doctor_detalis_model.dart';
import 'package:dochome/features/home/widgets/doctor_info.dart';
import 'package:flutter/material.dart';

class NursingStuff extends StatelessWidget {
  const NursingStuff({super.key});
  static List nursingStuff = const [
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
    return Scaffold(
      appBar: const CustomAppBar(titel: 'Nursing Stuff'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          itemCount: nursingStuff.length,
          itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: DoctorInfoItem(doctorDetalisModel: nursingStuff[index]),
          );
        }),
      ),
    );
  }
}
