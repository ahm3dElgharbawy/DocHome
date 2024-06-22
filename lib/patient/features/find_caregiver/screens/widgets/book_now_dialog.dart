// import 'package:dochome/common/widgets/buttons/rounded_button.dart';
// import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
// import 'package:dochome/common/widgets/text_fields/normal_text_field.dart';
// import 'package:dochome/patient/features/find_caregiver/logic/booking_cubit/booking_cubit.dart';
// import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
// import 'package:dochome/patient/features/find_caregiver/logic/location_cubit/location_cubit.dart';
// import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
// import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
// import 'package:dochome/utils/constants/sizes.dart';
// import 'package:dochome/utils/helpers/extension.dart';
// import 'package:dochome/utils/services/patient_local.dart';
// import 'package:dochome/utils/validators/text_field_validator.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class BookNowDialogWidget extends StatelessWidget {
//   const BookNowDialogWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     TextEditingController startDateController = TextEditingController();
    
//     return Dialog(
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//       child: Padding(
//         padding: const EdgeInsets.all(CSizes.defaultSpace),
//         child: Form(
//           key: formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 children: [
//                   Expanded(
//                     child: NormalTextField(
//                       hintText: "Latitude",
//                       label: "Lat",
//                       initialValue: "${position.latitude}",
//                       readOnly: true,
//                       maxLines: 1,
//                     ),
//                   ),
//                   const SizedBox(width: CSizes.spaceBtwInputFields),
//                   Expanded(
//                     child: NormalTextField(
//                       hintText: "Latitude",
//                       label: "Long",
//                       initialValue: "${position.longitude}",
//                       readOnly: true,
//                       maxLines: 1,
//                     ),
//                   ),
//                 ],
//               ),
//               NormalTextField(
//                 hintText: "Select Start Date",
//                 label: "Start Date",
//                 controller: startDateController,
//                 readOnly: true,
//                 onTap: () async {
//                   DateTime? bookingDate = await showDatePicker(
//                     context: context,
//                     firstDate: DateTime.now(),
//                     lastDate: DateTime(2050),
//                   );
//                   if (bookingDate != null) {
//                     startDateController.text = bookingDate.toIso8601String();
//                   }
//                 },
//                 validator: (p0) => CTextFieldValidator.requiredTextField(p0),
//               ),
//               BlocConsumer<BookingCubit, BookingState>(
//                 listener: (context, state) {
//                   if (state is BookingSuccess) {
//                     context.pushReplacementAll(const PatientLayoutScreen());
//                   }
//                 },
//                 builder: (context, state) {
//                   return CRoundedButton(
//                     onPressed: () async {
//                       if (formKey.currentState!.validate()) {
//                         BookingCubit.get(context).bookCaregiver(
//                           latitude: position.latitude,
//                           longitude: position.longitude,
//                           services: ServiceCubit.get(context).selectedServices,
//                           caregiverId:
//                               CaregiversCubit.get(context).selectedCaregiver.id,
//                           startDate: startDateController.text,
//                           phoneNumber: PatientLocal.get()!.phone,
//                         );
//                       }
//                     },
//                     title: "Book now",
//                     child: state is BookingLoading ? const CLoadingWidget(indicatorColor: Colors.white,) : null,
//                   );
//                 },
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
