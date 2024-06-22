import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesListView extends StatelessWidget {
  const ServicesListView({
    super.key,
    required this.categoryId
  });
  final int categoryId;
  @override
  Widget build(BuildContext context) {
    ServiceCubit.get(context).getAllServicesInCategory(categoryId);
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServiceSuccess) {
          return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: ServiceItem(
                    service: state.services[index],
                    index: index,
                  ),
                );
              });
        } else {
          return const Center(
            child: SizedBox(),
          );
        }
      },
    );
  }
}
