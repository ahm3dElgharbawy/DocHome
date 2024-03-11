import 'package:dochome/patient/features/find_caregiver/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/find_caregiver/widgets/services_list_view.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

import 'pysical_therapy_stuff.dart';

class PhysicalTherapyCategory extends StatelessWidget {
  const PhysicalTherapyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Physical Therapy Services',
        
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ServicesListView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return const PhysicalTherapyStuff();
          }));
        },
        backgroundColor: CColors.primary,
        child: Center(
          child: Transform.rotate(
              angle: -1.571 * 2,
              child: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
      ),
    );
  }
}
