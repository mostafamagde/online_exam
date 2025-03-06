
import '../models/erorr_data.dart';

class ServerError implements Exception{
  ErrorModel? errorModel;
  ServerError(this.errorModel);
}

class NetworkError implements Exception {
  String? message;
  NetworkError(this.message);
}

class ClientError implements Exception {
  ErrorModel? errorModel;
  ClientError(this.errorModel);
}

class ServerSideError implements Exception {
  ErrorModel? errorModel;
  ServerSideError(this.errorModel);
}