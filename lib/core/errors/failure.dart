import 'package:dio/dio.dart';

abstract class Failure {
  final String errMessage;

  Failure(this.errMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errMessage);
  factory ServerFailure.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        return ServerFailure('connection timeout with ApiServer');
      case DioErrorType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioErrorType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');

      case DioErrorType.badResponse:
        return ServerFailure.fromRespose(
            dioError.response!.statusCode!, dioError.response!.data);
      case DioErrorType.cancel:
        return ServerFailure('requst to ApiServer was canselld');

      case DioErrorType.unknown:
        return ServerFailure(
          dioError.error.toString(),
        );
      case DioErrorType.badCertificate:
        return ServerFailure('SSL certificate error,plese try agen later!');
      case DioErrorType.connectionError:
        if (dioError.message!.contains('SocketException')) {
          return ServerFailure('No Internet connection');
        }
        return ServerFailure('Unexpected Error,plese try agen later!');
      default:
        return ServerFailure('Oppes there was an error,plese try agen later!');
    }
  }

  factory ServerFailure.fromRespose(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('your requst not found,plese try agen later!');
    } else if (statusCode == 500) {
      return ServerFailure('internal server error,plese try agen later!');
    } else {
      return ServerFailure('Oppes there was an error,plese try agen later!');
    }
  }
}
