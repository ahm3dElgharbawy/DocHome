import 'package:dochome/patient/features/find_caregiver/views/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/service_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServicesListView extends StatelessWidget {
  ServicesListView({
    super.key,
  });
  bool? isSlected = false;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ServiceCubit, ServiceState>(
      builder: (context, state) {
        if (state is ServiceLoding) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is ServiceSuccess) {
          return ListView.builder(
              itemCount: state.services.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    isSlected = isSlected == true ? false : true;
                    // isSlected = isSlected == true ? false : true;
                    if (BlocProvider.of<ServiceCubit>(context)
                        .selectedServices
                        .contains(index + 1)) {
                      BlocProvider.of<ServiceCubit>(context)
                          .selectedServices
                          .remove(index + 1);
                    } else {
                      BlocProvider.of<ServiceCubit>(context)
                          .selectedServices
                          .add(index + 1);
                    }
                    print(BlocProvider.of<ServiceCubit>(context)
                          .selectedServices);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: ServiceItem(
                      service: state.services[index],
                      isSlected: isSlected!,
                    ),
                  ),
                );
              });
        } else {
          return const Center(
              child: SizedBox(
            child: Text('HHHHHHHHHH'),
          ));
        }
      },
    );
  }
}
