import 'package:online_exam/core/models/result.dart';
import 'package:online_exam/features/questions_feature/data/models/questions_response.dart';

abstract class GetQuestionsDataSource {
  Future<Result<QuestionsResponse>> getQuestions(String examId);
}