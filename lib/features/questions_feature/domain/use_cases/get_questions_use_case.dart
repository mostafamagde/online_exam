import 'package:injectable/injectable.dart';

import '../../../../core/models/result.dart';
import '../../data/models/questions_response.dart';
import '../get_questions_repo/get_questions_repo.dart';

@injectable
class GetQuestionsUseCase {
  final GetQuestionsRepo _getQuestionsRepo;

  GetQuestionsUseCase(this._getQuestionsRepo);


  Future<Result<QuestionsResponse>> call(String examId) => _getQuestionsRepo.getQuestions(examId);
}