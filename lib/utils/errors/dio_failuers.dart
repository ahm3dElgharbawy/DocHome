import 'dart:io';

import 'package:dio/dio.dart';

abstract class DioFailure {
  final String errMassage;

  const DioFailure(this.errMassage);
}

class DioServerFailure extends DioFailure {
  DioServerFailure(super.errMassage);

  factory DioServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return DioServerFailure('Connection time out');

      case DioExceptionType.sendTimeout:
        return DioServerFailure('send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return DioServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badCertificate:
        return DioServerFailure('Connection badCertificate');
      case DioExceptionType.badResponse:
        return DioServerFailure.fromResponse(
            dioError.response!.statusCode, dioError.response!.data);
      case DioExceptionType.cancel:
        return DioServerFailure('send timeout with ApiServer was canceld');
      case DioExceptionType.connectionError:
        return DioServerFailure('Connection error');
      case DioExceptionType.unknown:
        if (dioError.message!.contains('SocketException')) {
          return DioServerFailure(' no internet connection');
        }
        return DioServerFailure('Unexpected error ,try again');
      default:
        return DioServerFailure('Opps there was an error, please try later');
    }
  }

  factory DioServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return DioServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return DioServerFailure('Your reqest not found , try later');
    } else if (statusCode == 500) {
      return DioServerFailure('internat server error , try later');
    } else {
      return DioServerFailure('Opps there was an error, please try later');
    }
  }
}