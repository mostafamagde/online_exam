import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';


import '../../features/profile/data/remote_datasource/profile_api.dart';

@module
abstract class RegisterModule {
  @lazySingleton
  ProfileApi get profileApi => ProfileApi(dio);


  @lazySingleton

  Dio get dio {
    final dio = Dio();
    dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
    ));
    return dio;
  }

}
