part of 'wallet_cubit.dart';

sealed class WalletState extends Equatable {
  const WalletState();

  @override
  List<Object> get props => [];
}

final class WalletInitial extends WalletState {}
// my wallet 
final class LoadingWalletState extends WalletState {}
final class SuccessWalletState extends WalletState {}
final class FailureWalletState extends WalletState {
  final String message;
  const FailureWalletState({required this.message});
}
// wallet charging
final class LoadingWalletChargingRequestState extends WalletState {}
final class SuccessWalletChargingRequestState extends WalletState {}
final class FailureWalletChargingRequestState extends WalletState {
  final String message;
  const FailureWalletChargingRequestState({required this.message});
}
