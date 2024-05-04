import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/utils/endpoints/endpoints.dart';
import 'package:dochome/utils/services/api_calls.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:dochome/utils/services/response_handler.dart';
import 'package:http/http.dart' as http;
import 'package:dochome/utils/errors/failures.dart';

typedef LoginOrRegisterPatient = Future<http.Response> Function();

abstract class PatientAuthRepo {
  Future<Either<Failure, Patient>> patientLogin(
      {required String email, required String password});
  Future<Either<Failure, Unit>> patientRegister(
      Map<String, String> patientData);
  Future<Either<Failure, Unit>> sendOtp(String email);
  Future<Either<Failure, Unit>> checkOtp(String email, String otp);
  Future<Either<Failure, Unit>> resetPassword(String email, String newPassword);
  Future<Either<Failure, List<CenterModel>>> getCenters();
}

class PatientAuthRepoImpl implements PatientAuthRepo {
  final NetworkInfo networkInfo;
  const PatientAuthRepoImpl({required this.networkInfo});
  @override
  Future<Either<Failure, Patient>> patientLogin(
      {required email, required password}) async {
    Either result = await ResponseHandler.handle(
      () => ApiCalls.postData(
        EndPoints.loginPatient,
        {"email": email, "password": password},
      ),
    );
    return result.fold((failure) => left(failure), (response) {
      final Map<String, dynamic> user = jsonDecode(response.body)['user'];
      return right(
        Patient.fromJson(user),
      );
    });
  }

  @override
  Future<Either<Failure, Unit>> patientRegister(patientData) async {
    Either result = await ResponseHandler.handle(
        () => ApiCalls.postData(EndPoints.registerPatient, patientData));
    return result.fold((failure) => left(failure), (response) => right(unit));
  }

  @override
  Future<Either<Failure, Unit>> sendOtp(email) async {
    Either result = await ResponseHandler.handle(
        () => ApiCalls.postData(EndPoints.sendOtp, {'email': email}));
    return result.fold((failure) => left(failure), (response) => right(unit));
  }
  
  @override
  Future<Either<Failure, Unit>> checkOtp(email, otp) async {
    Either result = await ResponseHandler.handle(() =>
        ApiCalls.postData(EndPoints.checkOtp, {'email': email, 'otp': otp}));

    return result.fold((failure) => left(failure), (response) => right(unit));
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(email, newPassword) async {
    final Either result = await ResponseHandler.handle(() => ApiCalls.putData(
        EndPoints.resetPassword,
        {'email': email, 'new_password': newPassword}));

    return result.fold((failure) => left(failure), (response) => right(unit));
  }

  @override
  Future<Either<Failure, List<CenterModel>>> getCenters() async {
    Either result = await ResponseHandler.handle(
        () => ApiCalls.getData(EndPoints.getAllCenters));

    return result.fold((failure) => left(failure), (response) {
      List data = jsonDecode(response.body)['data'];
      return right(data.map((center) => CenterModel.fromJson(center)).toList());
    });
  }
}
