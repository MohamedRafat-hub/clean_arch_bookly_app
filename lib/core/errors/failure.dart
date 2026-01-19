import 'package:dio/dio.dart';

abstract class Failure {
  final String message;
  Failure(this.message);

}

class ServerFailure extends Failure{
  ServerFailure(super.message);

  factory ServerFailure.fromDioError(DioException e)
  {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection Timeout with ApiServer');
        break;
      case DioExceptionType.sendTimeout:
        return ServerFailure('Send Timeout with ApiServer');
        break;
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive Timeout with ApiServer');
        break;
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad Certificate with ApiServer');
        break;
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(e.response?.statusCode, e.response!.data);
        break;
      case DioExceptionType.cancel:
        return ServerFailure('Request to ApiServer was cancelled');
        break;
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
        break;
      case DioExceptionType.unknown:
        return ServerFailure('Unexpected Error, Please try again later.');
        break;
    }
  }

  factory ServerFailure.fromResponse(int? statusCode , dynamic response)
  {
    if(statusCode == 404)
      {
        return ServerFailure('Your Request was not found , please try again');
      }
    else if(statusCode == 500)
      {
        return ServerFailure('There is a problem with Server , Please try later');
      }
    else if(statusCode == 400 || statusCode == 401 || statusCode == 403)
      {
        return ServerFailure(response['error']['message']);
      }
    else
      {
        return ServerFailure('There was an Error , please try again');
      }
  }
}

class CacheFailure extends Failure{
  CacheFailure(super.message);
}

class NetworkFailure extends Failure{
  NetworkFailure(super.message);
}
