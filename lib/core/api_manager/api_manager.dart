import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exam_feature/data/models/exam_model.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/exam_feature/data/models/exams_response.dart';

import '../../features/explore_subjects/data/models/subject_response.dart';
import '../../features/profile/data/models/change_password_request.dart';
import '../../features/profile/data/models/profile_response_model.dart';
import '../../features/profile/data/models/user_model.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/exams')
  Future<ExamsResponse> getExams(@Query("subject") String subjectId);

  @GET('/subjects')
  Future<SubjectResponse> getSubjects();

  @GET("/auth/profileData")
  Future<ProfileResponseModel> getProfile();

  // PUT request to update profile
  @PUT("/auth/editProfile")
  Future<ProfileResponseModel> editProfile(

    @Body() UserModel user,
  );

  @PATCH('/auth/changePassword')
  Future<HttpResponse<dynamic>> changePassword(

    @Body() ChangePasswordRequest password,
  );
}
