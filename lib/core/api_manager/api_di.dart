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
          "token":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjcyOGYwODZhMDI0ZjA2ZWEyODZkYiIsInJvbGUiOiJ1c2VyIiwiaWF0IjoxNzQwMDU2OTExfQ.A34jo1EITjVyAP272-yj9_SV0kOWm1YO3NeGtRfgwMQ"
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
