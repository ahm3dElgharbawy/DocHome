import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/authentication/data/repo/auth.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PatientAuthRepo repoImp;
  final loginControllers =
      List.generate(2, (i) => TextEditingController()); // Login fields
  final signupControllers =
      List.generate(5, (i) => TextEditingController()); // Register fields
  bool rememberMe = false;
  bool agreeTerms = false;

  AuthBloc({required this.repoImp}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginPatientEvent) {
        emit(LoadingState()); // show loading indicator in the ui
        // ------------------------
        Either<Failure, Patient> eitherFailureOrSuccess = await repoImp
            .patientLogin(email: event.email, password: event.password);
        // ------------------------
        emit(eitherFailureOrSuccess.fold(
          (failure) => FailureState(
            message: _mapFailureToMessage(failure),
          ),
          (data) => SuccessState(message: CStrings.loginSuccess, data: data),
        ));
      } else if (event is RegisterPatientEvent) {
        emit(LoadingState());
        Either<Failure, Unit> eitherFailureOrSuccess =
            await repoImp.patientRegister(event.patientData);
        emit(_mapFailureOrSuccessState(
            eitherFailureOrSuccess, CStrings.registerSuccess));
      } else if (event is SendOtpEvent) {
        emit(LoadingState());
        Either<Failure, Unit> eitherFailureOrSuccess =
            await repoImp.sendOtp(event.email);
        emit(_mapFailureOrSuccessState(
            eitherFailureOrSuccess, CStrings.sendOtpSuccess));
      } else if (event is CheckOtpEvent) {
        emit(LoadingState());
        Either<Failure, Unit> eitherFailureOrSuccess =
            await repoImp.checkOtp(event.email, event.otp);
        emit(_mapFailureOrSuccessState(
            eitherFailureOrSuccess, CStrings.checkOtpSuccess));
      } else if (event is ResetPasswordEvent) {
        emit(LoadingState());
        Either<Failure, Unit> eitherFailureOrSuccess =
            await repoImp.resetPassword(event.email, event.newPassword);
        emit(_mapFailureOrSuccessState(
            eitherFailureOrSuccess, CStrings.resetPasswordSuccess));
      } else if (event is FetchCentersEvent) {
        emit(LoadingCentersState());
        Either<Failure, List<CenterModel>> eitherFailureOrSuccess =
            await repoImp.getCenters();
        emit(eitherFailureOrSuccess.fold(
          (failure) => FailureState(
            message: _mapFailureToMessage(failure),
          ),
          (centers) => LoadedCentersState(centers: centers),
        ));
      }
    });
  }

  AuthState _mapFailureOrSuccessState(
      Either eitherFailureOrSuccess, String successMessage) {
    return eitherFailureOrSuccess.fold(
      (failure) => FailureState(
        message: _mapFailureToMessage(failure),
      ),
      (success) => SuccessState(message: successMessage),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case InvalidCredentialsFailure:
        return CStrings.invalidCredentials;
      case NotFoundFailure:
        return CStrings.notFoundFailure;
      case OfflineFailure:
        return CStrings.offlineFailure;
      default:
        return CStrings.serverFailure;
    }
  }

  @override
  Future<void> close() {
    // Dispose all controllers
    for (final TextEditingController controller in loginControllers) {
      controller.dispose();
    }
    for (final TextEditingController controller in signupControllers) {
      controller.dispose();
    }
    return super.close();
  }
}
