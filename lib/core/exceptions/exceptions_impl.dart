
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
class NetworkException implements Exception {}

class EmailAlreadyExistsException implements Exception {}

class UserNotFoundException implements Exception {}

class WeakPasswordException implements Exception {}

class UpdateFailedError implements Exception {}