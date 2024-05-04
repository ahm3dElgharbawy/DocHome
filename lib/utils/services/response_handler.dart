import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ResponseHandler {
  static Future<Either<Failure, Response>> handle(
      Future<Response> Function() request) async {
    NetworkInfo networkInfo =
        NetworkInfoImpl(internetChecker: InternetConnectionChecker());
    try {
      if (await networkInfo.isConnected) {
        Response response = await request();
        if (response.statusCode == 200 || response.statusCode == 201) {
          return right(response);
        } else {
          return left(_fromResponse(response));
        }
      } else {
        return left(
          const OfflineFailure("Check your internet connection and try again"),
        );
      }
    } catch (e) {
      switch (e.runtimeType) {
        case ClientException:
          return left(const ClientFailure("Client failure"));
        case SocketException:
          return left(const SocketFailure("Network error"));
        default:
          return left(const Failure("Unexpected failure!"));
      }
    }
  }

  static Failure _fromResponse(Response response) {
    if (response.statusCode == 404) {
      return const NotFoundFailure("Your request not found!");
    } else if (response.statusCode == 401) {
      return const UnAuthorizedFailure("unauthorized");
    } else if (response.statusCode == 402) {
      return const Failure("some errors happened, try again later!");
    } else if (response.statusCode == 403) {
      return const ForbiddenFailure("don't have an access ");
    } else if (response.statusCode == 500) {
      return const ServerFailure("Server failure!");
    } else {
      return const UnExpectedFailure("Unexpected failure!");
    }
  }
}
