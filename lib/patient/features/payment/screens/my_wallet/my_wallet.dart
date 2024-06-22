import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/patient/features/payment/logic/cubit/wallet_cubit.dart';
import 'package:dochome/patient/features/payment/screens/my_wallet/widgets/dialog.dart';
import 'package:dochome/patient/features/payment/screens/my_wallet/widgets/stacked_wallets.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MyWalletScreen extends StatefulWidget {
  const MyWalletScreen({super.key});

  @override
  State<MyWalletScreen> createState() => _MyWalletScreenState();
}

class _MyWalletScreenState extends State<MyWalletScreen> {
  late WalletCubit cubit;
  @override
  void initState() {
    cubit = WalletCubit.get(context)..getMyWalletBalance();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(title: "My Wallet".tr),
      body: BlocConsumer<WalletCubit, WalletState>(
        listener: (context,state) {
          print(state);
          if(state is SuccessWalletChargingRequestState){
            "Success send wallet charging request".tr.showAsToast(Colors.green);
          } else if(state is FailureWalletChargingRequestState){
            "Failure send wallet charging request".tr.showAsToast(Colors.red,gravity: ToastGravity.TOP);
          }
        },
        builder: (context, state) {
          if (state is LoadingWalletState) {
            return const CLoadingWidget();
          } else if (state is FailureWalletState) {
            return CustomFailureWidget(onTap: () {
              cubit.getMyWalletBalance();
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
                    balance: cubit.balance,
                  ),
                  const SizedBox(height: CSizes.spaceBtwSections * 6),
                  CRoundedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => const WalletDialog()
                      );
                    },
                    title: "Charge the Wallet".tr,
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
