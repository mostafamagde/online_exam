import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:online_exam/features/profile/data/models/profile_response_model.dart';
import 'package:retrofit/retrofit.dart';
import '../models/change_password_request.dart';
import '../models/user_model.dart';

part 'profile_api.g.dart';

@RestApi(baseUrl: "https://exam.elevateegy.com/api/v1/auth/")
abstract class ProfileApi {
  factory ProfileApi(Dio dio, {String baseUrl}) = _ProfileApi;

  @GET("/profileData")
  Future<ProfileResponseModel> getProfile(
    @Header("token") String token,
  );

  // PUT request to update profile
  @PUT("/editProfile")
  Future<ProfileResponseModel> editProfile(
    @Header("token") String token,
    @Body() UserModel user,
  );

  @PATCH('/changePassword')
  Future<HttpResponse<dynamic>> changePassword(@Header("token") String token,
      @Body() ChangePasswordRequest password,
      );
}
