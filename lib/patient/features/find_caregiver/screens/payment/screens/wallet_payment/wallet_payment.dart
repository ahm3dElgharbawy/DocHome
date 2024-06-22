import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/find_caregiver/logic/booking_cubit/booking_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/location_cubit/location_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
import 'package:dochome/patient/features/payment/logic/cubit/wallet_cubit.dart';
import 'package:dochome/patient/features/payment/screens/my_wallet/widgets/stacked_wallets.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletPaymentScreen extends StatefulWidget {
  const WalletPaymentScreen({super.key, required this.totalPrice});
  final double totalPrice;

  @override
  State<WalletPaymentScreen> createState() => _WalletPaymentScreenState();
}

class _WalletPaymentScreenState extends State<WalletPaymentScreen> {
  @override
  void initState() {
    super.initState();
    WalletCubit.get(context).getMyWalletBalance();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(title: "My Wallet".tr),
      body: BlocBuilder<WalletCubit, WalletState>(

        builder: (context, state) {
          if (state is LoadingWalletState) {
            return const CLoadingWidget();
          } else if (state is FailureWalletState) {
            return CustomFailureWidget(onTap: () {
              WalletCubit.get(context).getMyWalletBalance();
            });
          }
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(CSizes.defaultSpace),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //? wallets stacked behind each others
                  CStackedWallets(
                    balance: WalletCubit.get(context).balance,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections),
                  RichText(
                    text: TextSpan(
                        style: CAppStyles.styleMedium14(context)
                            .copyWith(color: Colors.black),
                        children: [
                          TextSpan(text: "Total booking price is ".tr),
                          TextSpan(
                              text: " ${widget.totalPrice} ${'EGP'.tr} ",
                              style: CAppStyles.styleBold16(context)
                                  .copyWith(color: CColors.primary)),
                          TextSpan(text: "Finish your booking now".tr),
                        ]),
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections * 3),
                  //? password section
                  CTextFieldWithInnerShadow(
                    controller: BookingCubit.get(context).passwordController,
                    hintText: "Please enter your password".tr,
                    obscureText: true,
                    margin: EdgeInsets.zero,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections * 2),
                  BlocConsumer<BookingCubit, BookingState>(
                      listener: (context, state) {
                    if (state is BookingSuccess) {
                      "Success Booking with Caregiver".tr.showAsToast(Colors.green);
                      context.pushReplacementAll(const PatientLayoutScreen());
                    } else if (state is BookingFailure) {
                      "Failure booking".tr.showAsToast(Colors.red);
                    }
                  }, builder: (context, state) {
                    return CRoundedButton(
                      onPressed: () {
                        final position =
                            LocationCubit.get(context).currentPosition;
                        BookingCubit.get(context).bookCaregiver(
                          latitude: position!.latitude,
                          longitude: position.longitude,
                          services: ServiceCubit.get(context).selectedServices,
                          caregiverId:
                              CaregiversCubit.get(context).selectedCaregiver.id,
                          phoneNumber: PatientLocal.get()!.phone,
                        );
                      },
                      title: "Finish Booking".tr,
                      child: state is BookingLoading
                          ? const CLoadingWidget(
                              indicatorColor: Colors.white,
                            )
                          : null,
                    );
                  }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
