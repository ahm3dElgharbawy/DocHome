import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/utils/endpoints/endpoints.dart';
import 'package:dochome/utils/errors/exceptions.dart';
import 'package:dochome/utils/services/api_calls.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:dochome/utils/errors/failures.dart';

typedef LoginOrRegisterCaregiver = Future<http.Response> Function();

abstract class CaregiverAuthRepo {
  Future<Either<Failure, Caregiver>> caregiverLogin(
      {required String email, required String password});
  Future<Either<Failure, Unit>> caregiverRegister(
      Map<String, String> caregiverData);
  Future<Either<Failure, Unit>> sendOtp(String email);
  Future<Either<Failure, Unit>> checkOtp(String email, String otp);
  Future<Either<Failure, Unit>> resetPassword(String email, String newPassword);
}

class CaregiverAuthRepoImpl implements CaregiverAuthRepo {
  final NetworkInfo networkInfo;
  const CaregiverAuthRepoImpl({required this.networkInfo});
  @override
  Future<Either<Failure, Caregiver>> caregiverLogin({required email, required password}) async {
    if (await networkInfo.isConnected) {
      http.Response response = await ApiCalls.postData(
        EndPoints.loginCaregiver,
        {"email": email, "password": password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        final Map<String,dynamic> caregiver = jsonDecode(response.body)['caregiver'];
        return right(
          Caregiver.fromJson(caregiver),
        );
      } else {
        return left(ServerFailure());
      }
    } else {
      return left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, Unit>> caregiverRegister(caregiverData) async {
    return _getMessage(() async {
      return await ApiCalls.postData(EndPoints.registerCaregiver, caregiverData);
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

  Future<Either<Failure, Unit>> _getMessage(
      LoginOrRegisterCaregiver loginOrRegisterCaregiver) async {
    if (await networkInfo.isConnected) {
      try {
        http.Response response = await loginOrRegisterCaregiver();
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
