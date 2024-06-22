import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/stuff.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ServiceItem extends StatefulWidget {
  const ServiceItem(
      {super.key,
      required this.service,
      required this.index,
      this.forSearch = false});
  final ServiceModel service;
  final int index;
  final bool forSearch;

  @override
  State<ServiceItem> createState() => _ServiceItemState();
}

class _ServiceItemState extends State<ServiceItem> {
  bool isSelected = false;
  @override
  void initState() {
    super.initState();
    if (BlocProvider.of<ServiceCubit>(context)
        .selectedServices
        .contains(widget.index + 1)) {
      isSelected = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    print(BlocProvider.of<ServiceCubit>(context).selectedServices);
    return GestureDetector(
      onTap: () {
        if (widget.forSearch) {
          context.push(const StuffScreen(title: ""));
        } else {
          setState(() {
            isSelected = !isSelected;
          });

          if (BlocProvider.of<ServiceCubit>(context)
              .selectedServices
              .contains(widget.service.id)) {
            BlocProvider.of<ServiceCubit>(context)
                .selectedServices
                .remove(widget.service.id);
          } else {
            BlocProvider.of<ServiceCubit>(context)
                .selectedServices
                .add(widget.service.id!);
          }
        }
        // print(BlocProvider.of<ServiceCubit>(context).selectedServices);
      },
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isSelected ? CColors.primary : Colors.white,
          // color: Colors.white,
          border: Border.all(
            color: const Color(0xff756969),
            width: 0.5,
          ),
        ),
        child: Center(
          child: Text(
            trans(
                enText: widget.service.nameEn, arText: widget.service.nameAr),
            style: CAppStyles.styleBold16(context).copyWith(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
