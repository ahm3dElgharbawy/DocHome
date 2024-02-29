import 'package:dochome/features/find_cargiver/screens/analysis_labs/analysis_lab_stuff.dart';
import 'package:dochome/features/find_cargiver/screens/physical_therapy/pysical_therapy_stuff.dart';
import 'package:dochome/features/find_cargiver/widgets/custom_app_bar.dart';
import 'package:dochome/features/find_cargiver/widgets/services_list_view.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class PysicalTherapyCategory extends StatelessWidget {
  const PysicalTherapyCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        titel: 'Pysical Therapy Services',
        
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
            return PysicalTherapyStuff();
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
