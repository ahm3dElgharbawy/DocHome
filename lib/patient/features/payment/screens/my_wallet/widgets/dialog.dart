import 'package:dochome/common/widgets/dialogs/alert_dialog.dart';
import 'package:dochome/patient/features/payment/logic/cubit/wallet_cubit.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WalletDialog extends StatelessWidget {
  const WalletDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = WalletCubit.get(context);
    return BlocConsumer<WalletCubit, WalletState>(
      listener: (context,state) {
        if(state is SuccessWalletChargingRequestState){
          context.pop();
        }
      },
      builder: (context, state) {
        return CustomAlertDialog(
          onConfirm: () {
            cubit.sendWalletChargingRequest();
          },
          isLoading: state is LoadingWalletChargingRequestState ? true : false,
          content: "Sending wallet charging order to the admin".tr,
        );
      },
    );
  }
}
