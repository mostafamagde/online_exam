import 'package:dio/dio.dart';

import 'package:injectable/injectable.dart';

import 'api_manager.dart';

@module
abstract class DioInjection {
  @Singleton()
  Dio injectDio() {
    var dio = Dio(
      BaseOptions(
        connectTimeout: Duration(seconds: 60),
        headers: {
          "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YzlkOTc0NTU1NGIzMjg5MTI2MTYzMyIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQxMjgxNjUyfQ.hrGFZnbqlbOE-P1r1griRTKVrFfz3qdeRdhOAQyLITo"
        }
      ),
    );

    return dio;
  }

  @Singleton()
  RestClient injectRestClient(Dio dio) {
    return RestClient(dio);
  }
}
