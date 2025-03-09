import '../../../../core/models/result.dart';
import '../../data/models/questions_response.dart';

abstract class GetQuestionsRepo {
  Future<Result<QuestionsResponse>> getQuestions(String examId);
}