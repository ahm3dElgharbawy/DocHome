import 'dart:convert';

import 'package:dochome/utils/api/api_calls.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/api/response_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit() : super(WalletInitial());
  static WalletCubit get(BuildContext context) => BlocProvider.of(context);
  double balance = 0;
  getMyWalletBalance() async {
    emit(LoadingWalletState());
    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.myWallet),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          return FailureWalletState(message: failure.message);
        },
        (response) {
          balance = double.parse(jsonDecode(response.body)['balance']);
          return SuccessWalletState();
        },
      ),
    );
  }
  sendWalletChargingRequest() async {
    emit(LoadingWalletChargingRequestState());
    final failureOrSuccess = await ResponseHandler.handle(
      () => ApiCalls.getData(EndPoints.walletCharging),
    );
    emit(
      failureOrSuccess.fold(
        (failure) {
          return FailureWalletChargingRequestState(message: failure.message);
        },
        (response) {
          return SuccessWalletChargingRequestState();
        },
      ),
    );
  }
}
