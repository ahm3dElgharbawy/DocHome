import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/logic/booking_cubit/booking_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/location_cubit/location_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/screens/payment/screens/wallet_payment/wallet_payment.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BookingInfoScreen extends StatefulWidget {
  const BookingInfoScreen({super.key});

  @override
  State<BookingInfoScreen> createState() => _BookingInfoScreenState();
}

class _BookingInfoScreenState extends State<BookingInfoScreen> {
  late List<ServiceModel> services;
  @override
  void initState() {
    services = ServiceCubit.get(context).getServicesAndCalcPrices(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final position = LocationCubit.get(context).currentPosition;
    final locationCubit = LocationCubit.get(context);
    final bookingCubit = BookingCubit.get(context);
    final serviceCubit = ServiceCubit.get(context);

    return Scaffold(
      appBar: CMainAppBar(title: "Booking Details".tr),
      body: Center(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(CSizes.defaultSpace),
            child: Form(
              key: bookingCubit.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CRoundedContainer(
                    color: CColors.primary.withOpacity(.2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    radius: 10,
                    child: Column(
                      children: [
                        ...services.map(
                          (s) => Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(trans(enText: s.nameEn, arText: s.nameAr)),
                                Text("${s.price} ${'EGP'.tr}")
                              ],
                            ),
                          ),
                        ),
                        const Divider(
                          color: Colors.white,
                          endIndent: 10,
                          indent: 10,
                          thickness: 1.5,
                          height: 30,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Total Price".tr),
                            Text("${serviceCubit.totalPrice} ${'EGP'.tr}")
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  CTextFieldWithInnerShadow(
                    hintText: "Select Appointment Date".tr,
                    controller: bookingCubit.startDateController,
                    readOnly: true,
                    margin: EdgeInsets.zero,
                    onTap: () async {
                      DateTime? bookingDate = await showDatePicker(
                        context: context,
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2050),
                      );
                      if (bookingDate != null) {
                        bookingCubit.startDateController.text =
                            bookingDate.toIso8601String();
                      }
                    },
                    validator: (p0) =>
                        CTextFieldValidator.requiredTextField(p0),
                  ),
                  const SizedBox(height: CSizes.spaceBtwItems),
                  BlocBuilder<LocationCubit, LocationState>(
                    builder: (context, state) {
                      return CRoundedContainer(
                        onTap: () {
                          if (state is! LocationLoading &&
                              locationCubit.currentPosition == null) {
                            locationCubit.getCurrentLocation();
                          }
                        },
                        color: CColors.softGrey,
                        width: double.infinity,
                        height: 100,
                        radius: 15,
                        padding: const EdgeInsets.all(10),
                        child: state is LocationLoading
                            ? const CLoadingWidget()
                            : state is LocationSuccess
                                ? const Icon(
                                    Icons.check_circle_rounded,
                                    color: Colors.green,
                                    size: 40,
                                  )
                                : Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Get your current location".tr),
                                      const SizedBox(width: CSizes.spaceBtwItems),
                                      const Icon(Icons.location_on_sharp)
                                    ],
                                  ),
                      );
                    },
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  CRoundedButton(
                    onPressed: () async {
                      if (bookingCubit.startDateController.text == "") {
                        "You must select appointment date".tr.showAsToast(Colors.red);
                      } else if (locationCubit.currentPosition == null) {
                        "You must add your current location".tr
                            .showAsToast(Colors.red);
                      } else {
                        context.push(WalletPaymentScreen(totalPrice: serviceCubit.totalPrice,));
                      }
                    },
                    title: "Book now".tr,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
