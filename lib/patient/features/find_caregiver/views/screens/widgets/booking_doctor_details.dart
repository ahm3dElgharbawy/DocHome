import 'dart:convert';

import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/cargiver_model.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/booking_cubit/booking_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/location_cubit/location_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/about_section.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_elevated_botton.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/enable_location_screen.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/status_section.dart';
import 'package:dochome/patient/features/home/views/screens/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class BookingDoctorDetails extends StatefulWidget {
  const BookingDoctorDetails({
    super.key,
    required this.cargiverModel,
  });
  final CargiverModel cargiverModel;

  @override
  State<BookingDoctorDetails> createState() => _BookingDoctorDetailsState();
}

class _BookingDoctorDetailsState extends State<BookingDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> localPatientData =
        jsonDecode(PreferenceServices.getString("PATIENT")!);
    Patient patient = Patient.fromJson(localPatientData);
    //////////////////////////
    DateTime now = DateTime.now();
    DateFormat format = DateFormat('yyyy-MM-dd HH:mm:ss');
    String formatedDate = format.format(now);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(24),
          topEnd: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        widget.cargiverModel.name!,
                        style: CAppStyles.styleRegular23(context),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Text(
                        'Doctor of physical therapy',
                        style: CAppStyles.styleLight12(context),
                      ),
                    ),
                  ],
                ),
                CustomElevatedButton(
                  onTap: () {},
                  icon: Icons.phone_enabled_outlined,
                  color: CColors.primary,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CustomRateRow(),
                CustomElevatedButton(
                  onTap: () {},
                  icon: Icons.email,
                  color: Colors.amber,
                ),
              ],
            ),
            const Divider(),
            const AboutSection(),
            // const SizedBox(
            //   height: 20,
            // ),
            // const StatusSection(),
            const Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            SizedBox(
              child: BlocProvider.of<LocationCubit>(context).latitude == null
                  ? CRoundedButton(
                    color: Colors.blueGrey,
                      title: 'Enable location To Continue',
                      onPressed: () async {
                        await BlocProvider.of<LocationCubit>(context)
                            .getLocation();
                        setState(() {});
                      },
                    )
                  : CRoundedButton(
                      title: 'Make an Appointment',
                      onPressed: () async {
                        await BlocProvider.of<BookingCubit>(context)
                            .sendPostRequest(
                                latitude:
                                    BlocProvider.of<LocationCubit>(context)
                                        .latitude,
                                longitude:
                                    BlocProvider.of<LocationCubit>(context)
                                        .longitude,
                                services: BlocProvider.of<ServiceCubit>(context)
                                    .selectedServices,
                                caregiverId: widget.cargiverModel.id,
                                bookingDate: formatedDate,
                                startDate: '22/22024',
                                phoneNumber: patient.phone);
                        //  print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');

                        // print( BlocProvider.of<LocationCubit>(context)
                        //         .latitude);
                        // print( BlocProvider.of<LocationCubit>(context)
                        //         .longitude);
                        // print( BlocProvider.of<ServiceCubit>(context)
                        //     .selectedServices);
                        //     print(widget.cargiverModel.id);
                        //     print(formatedDate);
                        //     print(patient.phone);
                        //     print('wwwwwwwwwwwwwwwwwwwwwwwwwwwwwwwww');
                      },
                    ),
            ),

            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
