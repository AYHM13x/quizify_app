import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  const Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');

      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);

      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was canceled');

      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again!');
      default:
        if (dioException.message!.contains("Failed host lookup:")) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Opps There was an Error, Please try again!');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400) {
      return ServerFailure("Bad Request");
    } else if (statusCode == 401) {
      return ServerFailure("Unauthurized check your apikey");
    } else if (statusCode == 403) {
      return ServerFailure("!!TURN VPN ON!!");
    } else if (statusCode == 404) {
      return ServerFailure(response["error"]);
    } else if (statusCode == 500) {
      return ServerFailure('Internal Server Error, Please try later!');
    } else if (statusCode == 501) {
      return ServerFailure('Not Implemented, Please try later!');
    } else if (statusCode == 502) {
      return ServerFailure('Bad Gateway, Please try later1');
    } else if (statusCode == 503) {
      return ServerFailure('Service Unavailable, Please try later!');
    } else if (statusCode == 504) {
      return ServerFailure('Gateway Timeout, Please try later!');
    } else {
      return ServerFailure('Opps There was an Error, Please try again!');
    }
  }
}
