import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/authentication/data/repo/auth.dart';
import 'package:dochome/utils/constants/strings.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/helpers/extension.dart';
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
  List<CenterModel>? centers;
  String? centerId;

  AuthBloc({required this.repoImp}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is LoginPatientEvent) {
        emit(LoginPatientLoadingState()); // show loading indicator in the ui
        // ------------------------
        final eitherFailureOrSuccess = await repoImp.patientLogin(
            email: event.email, password: event.password);
        // ------------------------
        emit(eitherFailureOrSuccess.fold(
          (failure) => LoginPatientFailureState(
            message: failure.message,
          ),
          (patient) => LoginPatientSuccessState(
              message: CStrings.loginSuccess, patient: patient),
        ));
      } else if (event is RegisterPatientEvent) {
        emit(RegisterPatientLoadingState());
        final eitherFailureOrSuccess =
            await repoImp.patientRegister(event.patientData);
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => RegisterPatientFailureState(
              message: failure.message,
            ),
            (success) => RegisterPatientSuccessState(),
          ),
        );
      } else if (event is SendOtpEvent) {
        emit(SendOtpLoadingState());
        final eitherFailureOrSuccess = await repoImp.sendOtp(event.email);
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => SendOtpFailureState(message: failure.message),
            (success) => SendOtpSuccessState(),
          ),
        );
      } else if (event is CheckOtpEvent) {
        emit(CheckOtpLoadingState());
        final eitherFailureOrSuccess =
            await repoImp.checkOtp(event.email, event.otp);
        emit(
          eitherFailureOrSuccess.fold(
            (failure) {
              return CheckOtpFailureState(message: failure.message);
            },
            (success) {
              return CheckOtpSuccessState();
            },
          ),
        );
      } else if (event is ResetPasswordEvent) {
        emit(ResetPasswordLoadingState());
        final eitherFailureOrSuccess =
            await repoImp.resetPassword(event.email, event.newPassword);
        emit(
          eitherFailureOrSuccess.fold(
            (failure) => ResetPasswordFailureState(message: failure.message),
            (success) => ResetPasswordSuccessState(),
          ),
        );
      } else if (event is FetchCentersEvent) {
        emit(LoadingCentersState());
        final eitherFailureOrSuccess = await repoImp.getCenters();
        emit(eitherFailureOrSuccess.fold(
          (failure) => FailureLoadingCentersState(
            message: failure.message,
          ),
          (data) {
            centers = data;
            return SuccessLoadingCentersState(centers: data);
          },
        ));
      }
    });
  }

  // AuthState _mapFailureOrSuccessState(
  //     Either<Failure, dynamic> eitherFailureOrSuccess, String successMessage) {
  //   return eitherFailureOrSuccess.fold(
  //     (failure) => FailureState(
  //       message: failure.message,
  //     ),
  //     (success) => SuccessState(message: successMessage),
  //   );
  // }

  registerPatient(BuildContext context) {
    List<TextEditingController> controllers = signupControllers;
    //? show error on confirmation password not match
    if (controllers.elementAt(3).text != controllers.elementAt(4).text) {
      return CStrings.passwordNotMatch.showAsToast(Colors.red);
    }
    //? show error on not accept terms and conditions
    if (!agreeTerms) {
      CStrings.agreeTerms.showAsToast(Colors.red);
    }
    //? form data
    Map<String, String> patientData = {
      'name': controllers.elementAt(0).text,
      'phone': controllers.elementAt(1).text,
      'email': controllers.elementAt(2).text,
      'password': controllers.elementAt(3).text,
      'password_confirmation': controllers.elementAt(4).text,
      'center_id': centerId!,
    };
    //? register event
    add(RegisterPatientEvent(patientData: patientData));
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
