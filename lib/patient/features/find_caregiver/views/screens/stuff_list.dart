import 'package:dochome/patient/features/find_caregiver/views/logic/cargiver_cubit/cargiver_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/home/views/screens/widgets/doctor_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StuffList extends StatelessWidget {
  const StuffList({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: '$title Stuff'),
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
                      child:
                          DoctorInfoItem(cargiverModel: state.cargivers[index]),
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
