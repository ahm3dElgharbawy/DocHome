import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/authentication/data/models/center.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/utils/endpoints/endpoints.dart';
import 'package:dochome/utils/errors/exceptions.dart';
import 'package:dochome/utils/services/api_calls.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:flutter/material.dart';
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
    if (await networkInfo.isConnected) {
      http.Response response = await ApiCalls.postData(
        EndPoints.loginPatient,
        {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String,dynamic> user = jsonDecode(response.body)['user'];
        debugPrint('user: $user');
        
        return right(
          Patient.fromJson(user),
        );
      } else {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> patientRegister(patientData) async {
    return _getMessage(() async {
      return await ApiCalls.postData(EndPoints.registerPatient, patientData);
    });
  }

  @override
  Future<Either<Failure, Unit>> sendOtp(email) async {
    return _getMessage(() async {
      return await ApiCalls.postData(EndPoints.sendOtp, {'email': email});
    });
  }

  @override
  Future<Either<Failure, Unit>> checkOtp(email, otp) async {
    return _getMessage(() async {
      return await ApiCalls.postData(
          EndPoints.checkOtp, {'email': email, 'otp': otp});
    });
  }

  @override
  Future<Either<Failure, Unit>> resetPassword(email, newPassword) async {
    return _getMessage(() async {
      return ApiCalls.putData(EndPoints.resetPassword,
          {'email': email, 'new_password': newPassword});
    });
  }

  @override
  Future<Either<Failure, List<CenterModel>>> getCenters() async {
    if (await networkInfo.isConnected) {
      http.Response response = await ApiCalls.getData(EndPoints.getAllCenters);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List data = jsonDecode(response.body)['data'];
        return right(
            data.map((center) => CenterModel.fromJson(center)).toList());
      } else {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  Future<Either<Failure, Unit>> _getMessage(
      LoginOrRegisterPatient loginOrRegisterPatient) async {
    if (await networkInfo.isConnected) {
      try {
        http.Response response = await loginOrRegisterPatient();
        debugPrint('====== Response body: ${response.body}');
        if (response.statusCode == 200 || response.statusCode == 201) {
          return right(unit);
        } else if (response.statusCode == 401) {
          throw InvalidCredentialsException();
        } else if(response.statusCode == 404){
          throw NotFoundException();
        }
        else {
          throw ServerException();
        }
      } catch (e) {
        return left(_exceptionToFailure(e));
      }
    } else {
      return left(OfflineFailure());
    }
  }

  Failure _exceptionToFailure(exception) {
    switch (exception.runtimeType) {
      case InvalidCredentialsException:
        return InvalidCredentialsFailure();
      case NotFoundException :
        return NotFoundFailure();
      default:
        return ServerFailure();
    }
  }
}
