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
        baseUrl: "https://ecommerce.routemisr.com/",
      ),
    );

    return dio;
  }

  @Singleton()
  RestClient injectRestClient(Dio dio) {
    return RestClient(dio);
  }
}
