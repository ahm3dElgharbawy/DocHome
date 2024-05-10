import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/service_cubit/service_cubit.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceItem extends StatefulWidget {
  ServiceItem({
    super.key,
    required this.service,
    required this.index,
  });
  final ServiceModel service;
  final int index;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool? isSlected =  false;
  @override
  void initState() {
    if (BlocProvider.of<ServiceCubit>(context).selectedServices.contains(widget.index +1)
        ) {
          isSlected = true;
        }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSlected = isSlected == true ? false : true;
        });

        if (BlocProvider.of<ServiceCubit>(context)
            .selectedServices
            .contains(widget.index + 1)) {
          BlocProvider.of<ServiceCubit>(context)
              .selectedServices
              .remove(widget.index + 1);
        } else {
          BlocProvider.of<ServiceCubit>(context)
              .selectedServices
              .add(widget.index + 1);
        }
        print(BlocProvider.of<ServiceCubit>(context).selectedServices);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(26),
          color: isSlected! ? CColors.primary : Colors.white,
          // color: Colors.white,
          border: Border.all(
            color: const Color(0xff756969),
            width: 0.5,
          ),
        ),
        child: Center(
            child: Text(
          widget.service.nameEn!,
          style: CAppStyles.styleBold16(context).copyWith(
            color: isSlected! ? Colors.white : Colors.black,
          ),
        )),
      ),
    );
  }
}
