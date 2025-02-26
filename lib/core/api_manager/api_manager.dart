import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:online_exam/features/exam_feature/data/models/exam_data.dart';

import 'package:retrofit/retrofit.dart';

import '../../features/exam_feature/data/models/exams_response.dart';

import '../../features/explore_subjects/data/models/subject_response.dart';

part 'api_manager.g.dart';

@RestApi(baseUrl: 'https://exam.elevateegy.com/api/v1/')
abstract class RestClient {
  factory RestClient(Dio dio, {String? baseUrl}) = _RestClient;

  @GET('/exams')
  Future<ExamsResponse> getExams();
  @GET('/subjects')
  Future<SubjectResponse> getSubjects();

}
