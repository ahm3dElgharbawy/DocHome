import 'package:dochome/patient/features/find_caregiver/views/screens/stuff_list.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/services_list_view.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: '$title Services',
      ),
      body: const Padding(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ServicesListView(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return  StuffList(title: title,);
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
