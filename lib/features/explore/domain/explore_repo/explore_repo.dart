import 'package:online_exam/features/explore/data/models/exams_response.dart';

abstract class ExploreRepo {
  Future<ExamsResponse>getExams();

}