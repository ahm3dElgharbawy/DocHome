import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/stuff.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/custom_app_bar.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/services_list_view.dart';
import 'package:dochome/patient/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesScreen extends StatefulWidget {
  const ServicesScreen({
    super.key,
    required this.title,
  });
  final String title;

  @override
  State<ServicesScreen> createState() => _ServicesScreenState();
}

class _ServicesScreenState extends State<ServicesScreen> {
  @override
  void initState() {
    super.initState();
    ServiceCubit.get(context).selectedServices.clear();
  }

  @override
  Widget build(BuildContext context) {
    int categoryId = CategoriesCubit.get(context).selectedCategoryId;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Services'.tr,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
        child: ServicesListView(
          categoryId: categoryId,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (BlocProvider.of<ServiceCubit>(context)
              .selectedServices
              .isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) {
                return StuffScreen(
                  title: widget.title,
                );
              }),
            );
          }
        },
        backgroundColor: CColors.primary,
        child: const Center(
          child: Icon(Icons.arrow_forward_ios_rounded),
        ),
      ),
    );
  }
}
