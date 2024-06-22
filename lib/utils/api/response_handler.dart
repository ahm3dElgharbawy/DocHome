import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ResponseHandler {
  static Future<Either<Failure, Response>> handle(
      Future<Response> Function() request) async {
    try {
      NetworkInfo networkInfo =
          NetworkInfoImpl(internetChecker: InternetConnectionChecker());
      if (await networkInfo.isConnected) {
        Response response = await request();
        print(response.body);
        if (response.statusCode == 200 || response.statusCode == 201) {
          return right(response);
        } else {
          return left(_fromResponse(response));
        }
      } else {
        return left(
          OfflineFailure("Check your internet connection and try again".tr),
        );
      }
    } catch (e) {
      switch (e.runtimeType) {
        case ClientException:
          return left(ClientFailure("Client failure".tr));
        case SocketException:
          return left(SocketFailure("Network error".tr));
        default:
          return left(Failure(e.toString()));
      }
    }
  }

  static Failure _fromResponse(Response response) {
    if (response.statusCode == 404) {
      return NotFoundFailure("Your request not found!".tr);
    } else if (response.statusCode == 401) {
      return UnAuthorizedFailure("unauthorized".tr);
    } else if (response.statusCode == 402) {
      return Failure("some errors happened, try again later!".tr);
    } else if (response.statusCode == 403) {
      return ForbiddenFailure("don't have an access ".tr);
    } else if (response.statusCode == 500) {
      return ServerFailure("Server failure!".tr);
    } else {
      return UnExpectedFailure("Unexpected failure!".tr);
    }
  }
}
