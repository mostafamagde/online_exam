import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/explore/data/models/exam_data.dart';
import 'package:online_exam/features/explore/data/models/exams_response.dart';
import 'package:retrofit/retrofit.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/exams')
  Future<ExamsResponse> getExams();
}
