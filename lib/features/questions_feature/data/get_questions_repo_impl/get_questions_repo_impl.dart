import 'package:injectable/injectable.dart';
import 'package:online_exam/core/models/result.dart';

import 'package:online_exam/features/questions_feature/data/models/questions_response.dart';

import '../../domain/get_questions_repo/get_questions_repo.dart';
import '../get_questions_data_source/get_questions_data_source.dart';
@Injectable(as: GetQuestionsRepo)
class GetQuestionsRepoImpl implements GetQuestionsRepo{
  final GetQuestionsDataSource _getQuestionsDataSource;
  GetQuestionsRepoImpl(this._getQuestionsDataSource);
  @override
  Future<Result<QuestionsResponse>> getQuestions(String examId) async{
    var response= await _getQuestionsDataSource.getQuestions(examId);
    print(response);
    print("suiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
return response;
  }
}