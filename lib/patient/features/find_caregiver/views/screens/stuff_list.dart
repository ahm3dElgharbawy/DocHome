import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo_impl.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/cargiver_cubit/cargiver_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/home/models/doctor_details_model.dart';
import 'package:dochome/patient/features/home/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StuffList extends StatelessWidget {
  const StuffList({super.key});
  static List nursingStuff = const [
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
    return Scaffold(
      appBar: const CustomAppBar(title: 'Nursing Stuff'),
      body: BlocBuilder<CargiverCubit, CargiverState>(
        builder: (context, state) {
          if (state is CargiverLoding) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CargiverSuccess) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: state.cargivers.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: DoctorInfoItem(
                          cargiverModel: state.cargivers[index]),
                    );
                  }),
            );
          } else {
            return const Center(
                child: SizedBox(
              child: Text('HHHHHHHHHH'),
            ));
          }
        },
      ),
    );
  }
}






//  return Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 20),
//               child: ListView.builder(
//                   itemCount: nursingStuff.length,
//                   itemBuilder: (context, index) {
//                     return Padding(
//                       padding: const EdgeInsets.only(bottom: 10),
//                       child: DoctorInfoItem(
//                           doctorDetailsModel: nursingStuff[index]),
//                     );
//                   }),
//             );