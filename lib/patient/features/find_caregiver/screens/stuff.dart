import 'package:dochome/common/widgets/empty_widget.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_state.dart';
import 'package:dochome/patient/features/find_caregiver/screens/booking_screen.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:dochome/patient/features/home/screens/widgets/doctor_info.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StuffScreen extends StatefulWidget {
  const StuffScreen({super.key, required this.title});
  final String title;

  @override
  State<StuffScreen> createState() => _StuffScreenState();
}

class _StuffScreenState extends State<StuffScreen> {
  late CaregiversCubit cubit;
  @override
  void initState() {
    super.initState();
    int categoryId = CategoriesCubit.get(context).selectedCategoryId;
    cubit = CaregiversCubit.get(context)..getAllCaregivers(id: categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Stuff'.tr),
      body: BlocBuilder<CaregiversCubit, CaregiversState>(
        builder: (context, state) {
          print(state);
          if (state is CaregiverFailure) {
            return const CustomEmptyWidget();
          } else if (state is CaregiverSuccess) {
            if (state.caregivers.isEmpty) {
              return Center(
                child: Text(
                  "No caregivers".tr,
                  style: const TextStyle(color: Colors.black),
                ),
              );
            }
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: ListView.builder(
                  itemCount: state.caregivers.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) {
                            CaregiversCubit.get(context).selectedCaregiver =
                                state.caregivers[index];
                            return const BookingScreen();
                          }),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child:
                            DoctorInfoItem(caregiver: state.caregivers[index]),
                      ),
                    );
                  }),
            );
          } else {
            return const CLoadingWidget(
              indicatorColor: Colors.blue,
            );
          }
        },
      ),
    );
  }
}
